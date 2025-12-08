// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract Day4_SafeVault is ReentrancyGuard {
    mapping(address => uint256) public balances;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // 🛡️ FIX 1 — CEI Pattern
    // 🛡️ FIX 2 — nonReentrant modifier
    function withdraw() public nonReentrant {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "Zero balance");

        balances[msg.sender] = 0; // ❗ Update BEFORE sending ETH

        (bool ok, ) = msg.sender.call{value: amount}("");
        require(ok, "Transfer failed");
    }

    function vaultBalance() public view returns (uint) {
        return address(this).balance;
    }
}
