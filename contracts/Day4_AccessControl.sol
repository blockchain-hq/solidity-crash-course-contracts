// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Day4_AccessControl is Ownable {
    uint256 public value;

    constructor() Ownable(msg.sender) {}

    function setValue(uint _v) public onlyOwner {
        value = _v;
    }

    // Emergency Stop Example
    function emergencyWithdraw() public onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    receive() external payable {}
}
