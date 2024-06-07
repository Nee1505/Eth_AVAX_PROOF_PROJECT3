
const web3 = new Web3('https://mainnet.infura.io/v3/4143556efe9f49a8b52ea9fdd7072881');
let contract_abi = [
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"internalType": "address",
				"name": "sender",
				"type": "address"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "message",
				"type": "string"
			}
		],
		"name": "messLog",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [],
		"name": "messLog2",
		"type": "event"
	},
	{
		"inputs": [],
		"name": "test",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
];
let EventTest = new web3.eth.Contract(contract_abi);
let EventTestContract = ClientReceipt.at("0x5B38Da6a701c568545dCfcB03FcB875f56beddC4");

EventTestContract.transfer(function(err, data) {
   if (!err)
   console.log(data);
});
