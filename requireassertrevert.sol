// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract MYContract {
    address public contractOwner;
    uint public storedNumber;

    constructor() {
        contractOwner = msg.sender;
    }

    modifier onlyContractOwner {
        require(msg.sender == contractOwner, "Access denied: Only the contract owner can execute this");
        _;
    }

    function updateNumber(uint _num) public onlyContractOwner {
        // Ensure the number is between 1 and 50
        require(_num > 0 && _num <= 50, "Invalid number: Must be between 1 and 50");
        storedNumber = _num;
    }

    function addToNumber(uint _value) public onlyContractOwner {
        uint newStoredNumber = storedNumber + _value;

        // Ensure no overflow occurs
        assert(newStoredNumber >= storedNumber);

        storedNumber = newStoredNumber;
    }

    function causeRevert() public pure {
        // Revert the transaction with a specific message
        revert("This function causes a revert");
    }

    function demoRequire() public pure returns (string memory) {
        // Demonstrate require statement
        require(2 + 3 == 5, "Math error: 2 + 3 must be 5");
        return "Require statement executed successfully";
    }

    function demoAssert() public pure returns (string memory) {
        // Demonstrate assert statement
        assert(2 + 3 == 5); // This should always be true
        return "Assert statement executed successfully";
    }

    function demoRevert() public pure returns (string memory) {
        // Demonstrate revert statement
        revert("Revert statement executed");
    }
}
