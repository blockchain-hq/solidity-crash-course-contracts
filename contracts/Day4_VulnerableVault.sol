// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Day4_VulnerableVault {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // ❌ THIS IS VULNERABLE TO REENTRANCY
    function withdraw() public {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "Zero balance");

        // ❌ External call BEFORE state update
        (bool ok, ) = msg.sender.call{value: amount}("");
        require(ok, "Transfer failed");

        // ❌ Balance reset happens AFTER transfer
        balances[msg.sender] = 0;
    }

    // helper to see contract balance
    function vaultBalance() public view returns (uint) {
        return address(this).balance;
    }
}
