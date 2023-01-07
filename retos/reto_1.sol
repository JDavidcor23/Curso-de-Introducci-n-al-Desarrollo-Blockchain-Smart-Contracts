// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CrodFunding {
    // This contract has six public variables: "id" (a string), "name" (a string), "description" (a string), "author" (an address), "state" (a string) and "funds" (a uint).
    string public id;
    string public name;
    string public description;
    address payable public author;
    string public state = "Opened";
    uint public funds;

    // It also has a public variable "fundraisingGoal" which is a uint.
    uint public fundraisingGoal;

    // The contract has a constructor function, which is a special function that is called when the contract is deployed to the blockchain. 
    // It takes in three string arguments: "id", "name", and "description", and one uint argument: "fundraisingGoal".
    constructor(string memory _id, string memory _name, string memory _description, uint _fundraisingGoal){

    // Inside the function, the value of the arguments are assigned to the corresponding contract variables. 
        id = _id;
        name = _name;
        description = _description;

    // The "fundraisingGoal" variable is correctly assigned the value of the "_fundraisingGoal" argument.
        fundraisingGoal = _fundraisingGoal;

    // The "author" variable is set to the address of the account that deployed the contract (also known as the "msg.sender").
        author = payable(msg.sender);
    }


    // This function is named "fundProject" and it is marked as "public" and "payable", which means that it can be called by any external contract or account and it can receive Ether as an input.
    function fundProject() public payable {

    // Inside the function, the balance of the "author" contract is increased by the value of the message sent to this function (also known as "msg.value"). This is done using the "transfer" function, which sends the specified amount of Ether from the contract to the account specified as an argument.
        author.transfer(msg.value);

    // The global variable "funds" is also increased by the value of "msg.value".
        funds+= msg.value;
    }

    // This function is named "changeProjectState" and it takes in a string argument called "newState". It is marked as "public", which means that it can be called by any external contract or account.
    function changeProjectState(string calldata newState) public {

    // Inside the function, the global variable "state" is set equal to the value of the "newState" argument.
        state = newState;
    }

}