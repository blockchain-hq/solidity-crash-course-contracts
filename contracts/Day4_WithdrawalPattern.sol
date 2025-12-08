// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Day4_WithdrawalPattern {
    mapping(address => uint) public balances;

    // Save user balance
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // ❌ PUSH Payment (Bad — Contract Sends ETH)
    function pushPayment() public {
        uint amount = balances[msg.sender];
        require(amount > 0, "No funds");
        (bool ok, ) = msg.sender.call{value: amount}("");
        require(ok, "Send failed");
        balances[msg.sender] = 0;
    }

    // ✔ PULL Payment (Good — User Withdraws)
    function withdraw() public {
        uint amount = balances[msg.sender];
        require(amount > 0, "No funds");
        balances[msg.sender] = 0;
        (bool ok, ) = msg.sender.call{value: amount}("");
        require(ok, "Withdraw failed");
    }
}
