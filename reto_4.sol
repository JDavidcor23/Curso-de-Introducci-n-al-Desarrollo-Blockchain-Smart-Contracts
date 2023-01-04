// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CrodFunding {
    string public id;
    address private owner;
    string public name;
    string public description;
    address payable public author;
    uint public state;
    uint public funds;
    uint public fundraisingGoal;

    constructor(string memory _id, string memory _name, string memory _description, uint _fundraisingGoal){
        id = _id;
        name = _name;
        description = _description;
        fundraisingGoal = _fundraisingGoal;
        owner = msg.sender;
        author = payable(msg.sender);
    }
    event FundProject(
        string message
    );
    event ChangeProjectState(
        string message
    );

    modifier stateOwner(){
        require(
            msg.sender == owner,
            'Only owner can be change the project name'
        );
        _;
    }

    modifier isOwner(){
        require(
            msg.sender != owner,
            'Only persons other than the owner can change the project name'
        );
        _;
    }

    function fundProject() public payable isOwner {
          // Check if the contract status is different from 1 (i.e. not equal to "CLOSED").
        require(state != 1, 'the state is CLOSED' );
        // It is checked if the value of the payment (msg.value) is greater than 1
        require(msg.value > 1, 'the value must be greater than 0' );
        author.transfer(msg.value);
        funds+= msg.value;
        emit FundProject('deposit successfull');
    }


    function changeProjectState(uint  newState) public stateOwner{
        //checks if the current state of the project is equal to the new state you want to establish
        require(state != newState, 'New state must be different' );
        state = newState;
        emit ChangeProjectState('the project state has been changed');

    }
}