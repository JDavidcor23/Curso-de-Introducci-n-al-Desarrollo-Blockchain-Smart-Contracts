// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//This code defines an Ethereum contract called "Permission".

contract Permission {
    //This line defines a private variable called "owner" of type "address". An address in Ethereum is a unique identification of an account, and can be used to send and receive Ether and other tokens.
    address private owner;

    //This line defines a public variable called "projectName" of type "string", and assigns it the value "Platzi". A string is a sequence of characters, and when declared as public, it can be accessed from outside the contract.
    string public projectName = 'Platzi';

    // This is the contract constructor, which is a special function that is executed when the contract is created. In this case, the variable "owner" is being assigned the value of the sender of the message ("msg.sender"), which would be the address of the account that created the contract.
    constructor (){
        owner = msg.sender;
    }

    //This is a "modifier", which is a function used to add additional behavior to other contract functions. In this case, the "onlyOwner" modifier checks if the sender of the message ("msg.sender") is equal to the variable "owner". If not, an exception will be thrown with the message "Only owner can be change the project name".
    modifier onlyOwner(){
        require(
            msg.sender == owner,
            'Only owner can be change the project name'
        );
        _;
    }
    
    //This is a public function called "changeProjectName", which allows to change the value of the variable "projectName". The function receives an input parameter called "_projectName" of type "string", and assigns it to the variable "projectName". The function is also annotated with the "onlyOwner" modifier, which means that it can only be executed by the account that owns the contract (i.e. the account that created the contract and is stored in the "owner" variable).
    function changeProjectName(string memory _projectName) public onlyOwner{
        projectName = _projectName;
    }
}