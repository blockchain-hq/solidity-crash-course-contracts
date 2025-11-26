// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Day1_HelloWorld {
    string public message;

    constructor() {
        message = "Hello Solidity";
    }

    function setMessage(string memory _newMessage) public {
        message = _newMessage;
    }
}
