# blockchain-developer-bootcamp-final-project
ConsenSys Academy final project 

On- chain relationship 

I created a decentralized application that allows a certain user to create a relationship between him and his special person which will be forever saved in the blockchain.
The user needs to enter his name, second person's name, the relationship they are in and the number of kids they have. 
User can also destroy his relationship by deleting persons name and setting his status to single.
 If the relationship is blessed with another child they can easily add the child to their relationship. 
 
 Youtube video (Ganache) faster local version:https://youtu.be/l0_EDDTRH0o 
 Youtube video (Ropsten) slower version: https://youtu.be/S2nC3y2gOm4

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

Prerequisites:
    Node.js >= v14
    Truffle and Ganache >= 5.4.19
    git clone REPOSITORY_URL

Backend - Blockchain/Smart Contracts
    Run npm install in project root to install smart contract dependencies
    Run local testnet in either port 7545 with Ganache GUI 
    truffle migrate --network development/ganache (for GUI)
    truffle console --network development/ganache
    Run tests in Truffle console: test

My ETH for the NFT certificate(which is awesome!): 0x4f415E45546E496adf520CDd94c1753d95875067
