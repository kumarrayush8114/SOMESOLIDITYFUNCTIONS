# mycontract showing use of some functions

A simple smart contract demonstrating the use of `require()`, `assert()`, and `revert()` statements in Solidity. This contract allows the owner to set and increment a stored number with specific constraints.

## Description

This project is designed to provide a basic example of how to use Solidity's error handling statements: `require()`, `assert()`, and `revert()`. The contract ensures that only the owner can update the number and provides functions that demonstrate each of these statements.

## Getting Started

### Installing

1. **Install MetaMask**: If you don't already have MetaMask installed, add it as an extension to your browser from [MetaMask's official website](https://metamask.io/).
2. **Create/Import Wallet**: Follow the instructions to create a new wallet or import an existing one.
3. **Connect to Test Network**: Switch to a test network (like Rinkeby or Ropsten) by clicking the network dropdown at the top of MetaMask.
4. **Get Test Ether**: Acquire some test ether from a faucet for the chosen test network (e.g., [Rinkeby Faucet](https://faucet.rinkeby.io/)).

### Executing program

1. **Open Remix**: Go to [Remix IDE](https://remix.ethereum.org/).
2. **Create a New File**: In the file explorer on the left, click the "New File" button, and name it `UniqueContract.sol`.
3. **Paste the Contract Code**: Copy and paste the following smart contract code into the new file.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract UniqueContract {
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
        require(_num > 0 && _num <= 50, "Invalid number: Must be between 1 and 50");
        storedNumber = _num;
    }

    function addToNumber(uint _value) public onlyContractOwner {
        uint newStoredNumber = storedNumber + _value;
        assert(newStoredNumber >= storedNumber);
        storedNumber = newStoredNumber;
    }

    function causeRevert() public pure {
        revert("This function causes a revert");
    }

    function demoRequire() public pure returns (string memory) {
        require(2 + 3 == 5, "Math error: 2 + 3 must be 5");
        return "Require statement executed successfully";
    }

    function demoAssert() public pure returns (string memory) {
        assert(2 + 3 == 5);
        return "Assert statement executed successfully";
    }

    function demoRevert() public pure returns (string memory) {
        revert("Revert statement executed");
    }
}
```

4. **Compile the Contract**: Click on the "Solidity Compiler" tab on the left, then click the "Compile MYContract.sol" button.
5. **Deploy the Contract**: 
    - Switch to the "Deploy & Run Transactions" tab on the left.
    - Set the environment to "Injected Web3" to use MetaMask for deployment.
    - Ensure `MYContract` is selected in the contract dropdown.
    - Click the "Deploy" button and confirm the transaction in MetaMask.
6. **Interact with the Deployed Contract**: 
    - In the "Deployed Contracts" section, expand your deployed `MYContract` instance.
    - Call the contract's functions (e.g., `updateNumber`, `addToNumber`, `demoRequire`) by entering parameters and clicking the buttons. MetaMask will prompt you to confirm transactions for state-changing functions.

## Help

For common issues, ensure the following:
- MetaMask is connected to the correct network.
- You have enough test ether for gas fees.

To get more information, run:
```
contractName.help()
```
(Replace `contractName` with your contract instance)

## Authors


AYUSH KUMAR 
https://x.com/ayushkumarr32


## License

This project is licensed under the MIT License - see the LICENSE.md file for details.

