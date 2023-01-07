// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CrodFunding {
    enum State { Opened, Closed }

    //store contributions
    struct Contribution {
        address contribution;
        uint value;
    }
    //index == string and items == Contribution[]
    mapping (string => Contribution[] ) public contributions;

    struct Project {
        string  id;
        string name;
        string  description;
        address payable author;
        State  state;
        uint  funds;
        uint  fundraisingGoal;
    }
    //Change name
    Project[] public projects;

    //Delete the constructor

    event FundProject(
        string message
    );
    event ChangeProjectState(
        string message
    );
    //Alert when a new project is created
    event CreateProject(
        string id,
        string name,
        string description,
        uint  fundraisingGoal
    );

    //INDEX
    modifier stateOwner(uint projectIndex){
        require(
            msg.sender == projects[projectIndex].author,
            'Only author can be change'
        );
        _;
    }

    //INDEX
    modifier isOwner(uint projectIndex){
        require(
            msg.sender != projects[projectIndex].author,
            'Only persons other than the author can change the project name'
        );
        _;
    }
    //Create a project
    function createProject(string calldata id, string calldata  name, string calldata  description, uint fundraisingGoal) public {
        require(fundraisingGoal > 0, 'fundraising goal must be greater than 0' );
        Project memory project = Project(id, name, description, payable(msg.sender), State.Opened, 0, fundraisingGoal);
        projects.push(project);
        emit CreateProject(id, name, description, fundraisingGoal);
    }
    
    function fundProject(uint projectIndex) public payable isOwner(projectIndex) {
        Project memory project = projects[projectIndex];
        require(project.state != State.Closed, 'the state is CLOSED' );
        require(msg.value > 1, 'the value must be greater than 0' );
        project.author.transfer(msg.value);
        project.funds+= msg.value;
        contributions[project.id].push(Contribution(msg.sender, msg.value)); 
        emit FundProject('deposit successfull');
    }


    function changeProjectState(State  newState, uint projectIndex) public stateOwner(projectIndex){
        Project memory project = projects[projectIndex];
        require(project.state != newState, 'New state must be different' );
        project.state = newState;
        emit ChangeProjectState('the project state has been changed');

    }
}