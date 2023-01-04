// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CrodFunding {
    enum State { Opened, Closed }

    struct Project {
        string  id;
        string  name;
        string  description;
        address payable  author;
        State  state;
        uint  funds;
        uint  fundraisingGoal;
    }
    Project public project;

    constructor(string memory _id, string memory _name, string memory _description, uint _fundraisingGoal){
        project = Project(_id, _name, _description, payable(msg.sender), State.Opened, 0, _fundraisingGoal);

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
        require(project.state != State.Closed, 'the state is CLOSED' );
        require(msg.value > 1, 'the value must be greater than 0' );
        project.author.transfer(msg.value);
        project.funds+= msg.value;
        emit FundProject('deposit successfull');
    }


    function changeProjectState(State  newState) public stateOwner{
        require(project.state != newState, 'New state must be different' );
        project.state = newState;
        emit ChangeProjectState('the project state has been changed');

    }
}