// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Day4_IntegerOverflowDemo {
    uint8 public num = 255;

    // 🔍 Solidity 0.8+ automatically prevents overflow
    function overflow() public {
        // ❌ Will revert instead of overflowing
        num += 1;
    }
}
