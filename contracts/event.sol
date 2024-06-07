//SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

//Event: Each transaction has an attached receipt, which contains zero or more log entries. The log entries represent the result of the events having been fired from a smart contract. An event in Solidity is defined as:
//event <event_name> (<event_parameters>)

//You can call an event using the emit keyword in the following manner:
//emit <event_name> (<event_arguments>)

contract Event{
    //Event declaration
    // Up to 3 parameters can be indexed
    //Indexed parameters help you filter the logs by the indexed parameter
    event messLog(address indexed sender, string message);
    event messLog2();

    function  test() public{
        emit messLog(msg.sender, "Hello World!");
        emit messLog(msg.sender, "Hello EVM!");
        emit messLog2();
    }
}

contract Test{
    event Deposit(address indexed _from, bytes32 indexed _id, uint _value);
    function deposit(bytes32 _id) public payable{
        emit Deposit(msg.sender,_id,msg.value);
    }
}