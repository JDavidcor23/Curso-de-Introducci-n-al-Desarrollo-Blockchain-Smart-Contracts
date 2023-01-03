// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Asset {
    //The variable "tokenName" is a string that is initialized with the value "CryptoPlatzi". This variable is public, which means that it can be read by any person or contract.
    string public tokenName = 'CryptoPlatzi';

    // The "ChangeName" event is fired every time the "changeName" function is called. The event includes two parameters: "editor" and "newName". "publisher" is the address of the account that is calling the "changeName" function and "newName" is the new name that is set in the "tokenName" variable.
    event ChangeName(
        address editor,
        string newName
    );
    //The "changeName" function takes an input parameter "newName" which is a string. The function simply assigns the value of "newName" to the variable "tokenName" and then fires the "ChangeName" event with the sender address (i.e., the account that is calling the function) and the new name as parameters.
    function changeName(string memory newName) public {
        tokenName = newName;
        emit ChangeName(msg.sender, newName);
    }
}