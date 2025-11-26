// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Day2_DataStructures {
    // State variable in storage
    string public name;

    // Dynamic array
    uint256[] public numbers;

    // Struct
    struct Person {
        string name;
        uint256 age;
    }

    // Mapping from address to struct
    mapping(address => Person) public users;

    // Event
    event UserCreated(address indexed user, string name, uint256 age);
    event NumberAdded(uint256 number);

    modifier onlyAdult(uint256 _age) {
        require(_age >= 18, "Age must be >= 18");
        _;
    }

    function setName(string memory _name) public {
        name = _name;
    }

    function createUser(
        string memory _name,
        uint256 _age
    ) public onlyAdult(_age) {
        users[msg.sender] = Person(_name, _age);
        emit UserCreated(msg.sender, _name, _age);
    }

    function addEvenNumber(uint256 _num) public {
        require(_num % 2 == 0, "Number not even");
        numbers.push(_num);
        emit NumberAdded(_num);
    }

    function getNumbers() public view returns (uint256[] memory) {
        return numbers;
    }
}
