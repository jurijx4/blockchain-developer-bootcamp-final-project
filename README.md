# blockchain-developer-bootcamp-final-project
ConsenSys Academy final project 

On- chain relationship 

I created a decentralized application that allows a certain user to create a relationship between him and his special person which will be forever saved in the blockchain.
The user needs to enter his name, second person's name, the relationship they are in and the number of kids they have. 
User can also destroy his relationship by deleting persons name and setting his status to single.
 If the relationship is blessed with another child they can easily add the child to their relationship. 
 

The directory structure

- contracts: Smart contracts that are deployed on the Rinkeby testnet.
    - Relationship.sol which is the main smart contract of this project.

- front-end: everything needed for the front end
    - abi.js which is the abi of the Relationship.sol
    - index.html 
    - index.js where all the magic with web3.js is made. 

- migrations: Migration files for deploying contracts in contracts directory

- test: Tests for smart contracts
    - ast_helper.js helper for checking the state variables
    - exceptionHelpers.js helper for exceptions
    - relationships_test.js main test file !!

How to run this project locally:

Truffle and ganache have been used for application development. See the Truffle website for installation instructions for your platform. The application can be worked on locally by,

1.	Clone this repo.
	git clone git@github.com:niallcreech/blockchain-developer-bootcamp-final-project.git
	cd blockchain-developer-bootcamp-final-project
2.	Installing Truffle and Ganache.

    
Youtube video (Ganache) faster local version:https://youtu.be/l0_EDDTRH0o 
	
Youtube video (Ropsten) slower version: https://youtu.be/S2nC3y2gOm4

My ETH for the NFT certificate(which is awesome!): 0x4f415E45546E496adf520CDd94c1753d95875067
