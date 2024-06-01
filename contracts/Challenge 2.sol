//SPDX-License-Identifier: MIT
pragma solidity 0.8.9;


//write a smart contract that uses view, pure, and payable functions. Ensure that the functions are accessible within the contract and derived contracts as well.
contract Parent{

   
    uint public a=3;

    //view function
    function mul(uint b) internal view returns(uint){
        return a*b;
    }

    //pure function
    function sub(uint x, uint y) internal pure returns(uint){
        return x - y;
    }

     uint public sum;

      //payable function
    function add(uint b) public payable returns(uint){
        sum=a+b;
        return sum;
    }

}

contract Child is Parent{
    uint public c=3;
    function add2()public  returns(uint){
        sum +=c;
        return sum;
    }

}