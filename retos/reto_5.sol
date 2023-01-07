// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CrodFunding {
    //struct
    struct Project {
        string  id;
        string  name;
        string  description;
        address payable  author;
        uint  state;
        uint  funds;
        uint  fundraisingGoal;
    }
    //declaration of the variable
    Project public project;

    constructor(string memory _id, string memory _name, string memory _description, uint _fundraisingGoal){
    //variable initialization
        project = Project(_id, _name, _description,payable(msg.sender), 0, 0, _fundraisingGoal);

    }
    event FundProject(
        string message
    );
    event ChangeProjectState(
        string message
    );

    modifier stateOwner(){
        require(
            msg.sender == project.author,
            'Only author can be change the project name'
        );
        _;
    }

    modifier isOwner(){
        require(
            msg.sender != project.author,
            'Only persons other than the author can change the project name'
        );
        _;
    }

    function fundProject() public payable isOwner {
        require(project.state != 1, 'the state is CLOSED' );
        require(msg.value > 1, 'the value must be greater than 0' );
        project.author.transfer(msg.value);
        project.funds+= msg.value;
        emit FundProject('deposit successfull');
    }


    function changeProjectState(uint  newState) public stateOwner{
        require(project.state != newState, 'New state must be different' );
        project.state = newState;
        emit ChangeProjectState('the project state has been changed');

    }
}