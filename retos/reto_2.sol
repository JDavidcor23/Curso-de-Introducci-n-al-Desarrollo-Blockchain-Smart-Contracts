// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CrodFunding {
    string public id;
    address private owner;
    string public name;
    string public description;
    address payable public author;
    string public state = "Opened";
    uint public funds;
    uint public fundraisingGoal;

    constructor(string memory _id, string memory _name, string memory _description, uint _fundraisingGoal){
        id = _id;
        name = _name;
        description = _description;
        fundraisingGoal = _fundraisingGoal;
        //initialize the variable
        owner = msg.sender;
        author = payable(msg.sender);
    }

    //The "stateOwner" modifier checks if the sender of the message ("msg.sender") is equal to the variable "owner". If not, an exception will be thrown with the message "Only owner can be change the project name".
    modifier stateOwner(){
        require(
            msg.sender == owner,
            'Only owner can be change the project name'
        );
        _;
    }

    //The "isOwner" modifier checks if the sender of the message ("msg.sender") is different from the "owner" variable. If not, an exception will be thrown with the message "Only persons other than the owner can change the project na
    modifier isOwner(){
        require(
            msg.sender != owner,
            'Only persons other than the owner can change the project name'
        );
        _;
    }

    //annotated with the "isOwner"

    function fundProject() public payable isOwner {
        author.transfer(msg.value);
        funds+= msg.value;
    }

    //annotated with the "stateOwner"

    function changeProjectState(string calldata newState) public stateOwner{
        state = newState;
    }
}