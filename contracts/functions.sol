//SPDX-License-Identifier: MIT
pragma solidity 0.8.9;


//Function- Reusable block of code

//Syntax of a function
// funciton <function name>(Parameter1,Parameter2) <Visibility type> <function type> returns(return type){
    //Body of the function
    //return return value;}


//Function types -

//Pure: No interaction with the blockchain
//View: can only read from the blockchain
//Payable: can recieve ether
//Fallback: executed if no matching function found. The fallback function doesn’t have any arguments and they don’t return any values.

//Function visibility - Visibility to a function specifies how the function is visible to the caller internally or externally.

//Public: Everywhere
//Private: Only inside the contract in which they are defined
//Internal: Declaring contract and derived contracts
//External: Outside the declaring contract(Can only be called outside the contract)
contract func{
    function exp2(uint x) pure  public  returns(uint){
        return (1<<x);
    }
    uint public data=7;

    function display() public view returns(uint){
        return (data);
    }
}

contract ViewAndPure{
    uint public x=5;

    //Promise not to modify the blockchain
    function addToX(uint y) public view returns(uint){
        return x+y;
    }

    //Promise not to modify or read from the blockchain.
    function add(uint i, uint j) public pure returns(uint){
        return i+j;
    }
}

 

contract payableContract {

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit () external payable {}

    function getBalance () external view returns (uint) {
        return address(this).balance;
    }
    

}
