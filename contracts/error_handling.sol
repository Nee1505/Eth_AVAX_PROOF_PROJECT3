//SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

//write a smart contract that implements the require(), assert() and revert() statements.


contract Error {
    int public balance=0;
    function deposit(int amount) public returns(int) {
        require(amount > 10, "You have to deposit at least 10 wei");
        balance +=amount;
        return balance;
    }

    function withdraw(int amount) public returns(int){
        if (balance<amount) {
            revert("Insufficient balance");
        }
        else{
           balance -= amount;
           return balance;
        }
    }



    function checkBalanceInvariant() public view returns(int){
        // Assert that balance is never below zero (should always hold)
        assert(balance >= 0);
        return balance;
    }
   
}
