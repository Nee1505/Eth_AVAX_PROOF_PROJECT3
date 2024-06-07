//SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

//Global functions have four contexts:
//1.Address 2.Block 3.Transaction 4.Message

// 1. Address Context : Any variable of the data type address can use the global functions defined in the address context. 
// Built-in functions defined in the address context are:

// [1]Balance [2]transfer() [3]send() [4]call(), staticcall(), delegatecall()

//[1] Balance: Returns the balance of the address in Wei. For an address mycontract, the function call is defined as 'mycontract.balance;'. This will return the balance of mycontract in Wei. The return type is uint256.

//[2] transfer(): Sends the given amount of Wei from the current account to the address mentioned. If you want to send x amount of Wei from the current account to an address mycontract, then the function call will be defined as follows: 'mycontract.transfer(uint256 x);'. The problem with the transfer function is if an error occurs during the transaction, the transaction fails.

//[3] send(): Sends the given amount of Wei from the current account to the address mentioned. If you want to send x amount of Wei from the current account to an address mycontract, then the function call will be defined as : 'mycontract.send(uint256 x);'. The return type of the send function is bool, and whenever a transaction encounters an error, the send function returns false. Based on this, appropriate action can be taken. This is what differentiates the send function from the transfer function.

//[4] call(), staticcall(), delegatecall(): These low-level functions don't go through the checks by the Solidity compiler. That's why it is not advised not to use them unless absolutely necessary. The call and staticcall functions work in a similar manner as the transfer or send function. 
 //However, delegatecall works differently. If A invokes B who makes a delegatecall to C, then the msg.sender in the delegatecall will be A and not B. This way we can preserve the original sender of the message. All these low-level functions take bytes as input and the return type is a combination of bool and bytes data types.

//2. Block Context: There are several in-built functions that exist in the global namespace, which are used mainly to provide information about the blocks in the blockchain. 
//The global functions defined in the block context are:

//block.coinbase: Returns the address of the miner rather than the currently mined block.
//block.difficulty: Returns the difficulty at the time when the current block was mined.
//block.timestamp: Returns the timestamp at which the current block was mined
//block.gaslimit: Returns the total gaslimit of all the transactions mined in the current block.
//block.number: Returns the number of the newest block in the blockchain


//3. Transaction Context: There are functions that exist in the global namespace, which are used mainly to provide information about the transactions in the network.
//tx.gasprice: Returns the gas price of the transaction sent by the sender as part of the transaction.
//tx.origin: Returns the address of the original sender of the transaction.

//4. Message Context: There are some global functions that are used to capture the properties of the messages.
//msg.value: Returns the number of Wei that was sent with the message or the transaction
//msg.sender: Returns the immediate sender of the message or the transaction. Unlike tx.origin, msg.sender returns the address of the previous account in the flow of the message. If A sends the message to B and then B sends it to C, then if C calls msg.sender on that message, it will receive the address of B as the return value.
//msg.gasleft: This function returns the remaining gas for the transaction. If an account feels that the gas remaining is inadequate or insufficient for a transaction to complete, then it will fail the transaction.

contract msg_context{
   mapping(address => uint) private balances;

    event Deposit(address indexed owner, uint amount);
    event Withdraw(address indexed owner, uint amount);
    event Transfer(address indexed from, address indexed to, uint amount);

    function deposit(address _account, uint _number) public payable  {
        balances[_account] += _number;
        emit Deposit(_account, _number);
        msg.value;
    }

    function withdraw(address _account, uint _number) public payable {
        require(balances[_account] > 0, "Insufficient Balance");
        balances[_account] -= _number;
        emit Withdraw(_account, _number);
       
    }

    function transfer(address _from, address _to, uint _number) public payable {
        require(balances[_from] >= _number, "You do not sufficient balance for this transaction");
        balances[_from] -= _number;
        balances[_to] += _number;
        emit Transfer(_from, _to, _number);
        msg.sender;
        
    }

    function getBalance(address _address) public view returns(uint) {
        return balances[_address];
    }

     function getRemainingGas() external view returns (uint256) {
        return gasleft();
    }
}