# blockchain-developer-bootcamp-final-project
ConsenSys Academy final project 

<h2>On- chain relationship </h2>
<b>Description:</b>

I created a decentralized application that allows a certain user to create a relationship between him and his special person which will be forever saved in the blockchain.
The user needs to enter his name, second person's name, the relationship they are in and the number of kids they have. 
User can also destroy his relationship by deleting persons name and setting his status to single.
 If the relationship is blessed with another child they can easily add the child to their relationship. 
 
 <b>Where to find it:</b><br>
 <a href="https://jurijx4.github.io/">Relationships website</a><br>
 <a href="https://ropsten.etherscan.io/address/0x9062b758469077CA7ff325D67867513ed37eA95F">Ropsten contract</a>

<b>The directory structure</b>

- contracts: Smart contracts that are deployed on the Rinkeby testnet.
    - Relationship.sol which is the main smart contract of this project.

- front-end: everything needed for the front end
    - abi.js which is the abi of the Relationship.sol
    - <b>index.html</b> 
    - index.js where all the magic with web3.js is made. 

- migrations: Migration files for deploying contracts in contracts directory

- test: Tests for smart contracts
    - ast_helper.js helper for checking the state variables
    - exceptionHelpers.js helper for exceptions
    - relationships_test.js main test file !!

<b>How to run this project locally:</b><br>
Prerequisites:<br>
- Node.js >= v14 <br>
- Truffle and Ganache >= 5.4.19


Truffle and ganache have been used for application development. See the Truffle website for installation instructions for your platform. The application can be worked on locally by,

1.	Clone this repo.<br>
	git clone https://github.com/jurijx4/blockchain-developer-bootcamp-final-project.git <br>
	cd blockchain-developer-bootcamp-final-project
2.	Installing Truffle and Ganache.
3.	Running the contract tests.(localhost) <br>
	npm install <br>
	truffle test

<b>Dapp videos: </b>   
Youtube video (Ganache) faster local version:https://youtu.be/l0_EDDTRH0o <br>	
Youtube video (Ropsten) slower version: https://youtu.be/S2nC3y2gOm4

My ETH address for the NFT certificate: 0x50e03e22E510fb767eb2bB1CA9c67C5c6aa1AAB8
