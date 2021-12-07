// SPDX-License-Identifier: MIT

pragma solidity 0.8.10;
import "..node_modules/@openzeppelin/contracts/utils/Counters.sol";
import "..node_modules/@openzeppelin/contracts/utils/math/SafeMath.sol";
import "..node_modules/@openzeppelin/contracts/access/Ownable.sol";
import "..node_modules/@openzeppelin/contracts/security/Pausable.sol";
import "..node_modules/@openzeppelin/contracts/security/ReentrancyGuard.sol";

/// @title Relationships
/// @author Jurij Požrl
/// @notice This contract allows you to define you relationship status on blockchain
/// @dev You can get hitched on blockchain
contract Relationships is Ownable, Pausable, ReentrancyGuard{
    using Counters for Counters.Counter;
    Counters.Counter private _relationshipIds;
    using SafeMath for uint256;

    ///@dev the cut that the contract will take from every relationship created on it. Will implement later ***
    uint cut;

    ///@dev state enum for describing the person relationship status
    enum Status { SINGLE, TAKEN, MARRIED} 

    ///@dev struct that defines all the needed data for the relationship
    struct Relationship{
        uint256 id;
        address creator;
        string  first_person;
        string second_person;
        Status status;
        uint kids;
    }

    ///@dev mapping from a uniqe address to a Relathionship... Our contract practices monogamy so is possible to only have one relationship at time
    mapping (address => Relationship) public addressToRelationship;

    ///@dev relationship prepositions for a certain address... Will implement later ***
    mapping (address => address[]) public userPrepositions; 

    ///@dev Emits when createRelathionship function is called
    event RelationshipCreated(string first_person,string second_person,Status status,uint kids);
    ///@dev Emits when itsNotWorking function is called
    event RelationshipTerminated(string name, Status status);
    ///@dev Emits when addKids function is called
    event addMoreKids(uint kids);


    ///@dev Check if the caller of the function is really msg.sender 
    ///@param _address address of msg.sender
    modifier verifyCaller (address _address) { 
     require (msg.sender == _address); 
    _;
  }

    ///@dev Check if the caller of the function is Taken or Married 
    ///@param _user the person who is in a relathionship
    modifier inRelationship(address _user){
        require(( addressToRelationship[_user].status == Status.MARRIED ) ||
                (addressToRelationship[_user].status == Status.TAKEN ));
        _;
    }

    ///@dev Checking if the person that we want to remove exsists in the relationship
    ///@param name the persons name we want to remove from relationship
    modifier personExsist(string memory name){
        string memory first_person = addressToRelationship[msg.sender].first_person;
        string memory second_person = addressToRelationship[msg.sender].second_person;
        require((keccak256(bytes(first_person)) == keccak256(bytes(name)) ) || 
                (keccak256(bytes(second_person)) == keccak256(bytes(name)) ));
    _;
    }


    ///@dev the cut that the contract will take from every relationship created on it. Will implement later ***
    ///@param newCut is the new value the contract will take for its cut when the relationship is made. Only owner can change that cut 
    function setCut(uint newCut ) public onlyOwner{
        cut = newCut;
    }
    
    ///@param first_person first persone of the relationship
    ///@param second_person second persone of the relationship
    ///@param status in what kind of relathionship this persons are
    ///@param kids how many kids does those persons have togheter
    ///@notice Create a new relationship
    ///@dev Save relationship into the smartcontract
    function createRelationship(
        string memory first_person,
        string memory second_person,
        Status status,
        uint kids)
        public
        verifyCaller(msg.sender)
        whenNotPaused
        nonReentrant
        {
            _relationshipIds.increment();
            uint256 newRelationshipId = _relationshipIds.current();
            addressToRelationship[msg.sender] = Relationship(newRelationshipId, msg.sender, first_person, second_person, status, kids);

            emit RelationshipCreated( first_person, second_person, status, kids);
    }

    ///@dev Delete the person choosed from the relaationship, used keccak256 to check which person to remove
    ///@param name the persons name we want to remove from relationship
    function itsNotWorking(string memory name) 
    public 
    payable
    inRelationship(msg.sender)
    personExsist(name) 
     {
        string memory first_person = addressToRelationship[msg.sender].first_person;
        string memory second_person = addressToRelationship[msg.sender].second_person;

        if (keccak256(bytes(first_person)) == keccak256(bytes(name)) ) {
            first_person = "";
        } else {
            second_person = "";
        }

        
        //addressToRelationship[msg.sender] = Relationship(id, msg.sender, first_person, second_person, Status.SINGLE, kids);
        addressToRelationship[msg.sender].first_person = first_person;
        addressToRelationship[msg.sender].second_person = second_person;
        addressToRelationship[msg.sender].status = Status.SINGLE;

        emit RelationshipTerminated( name,  Status.SINGLE);
     }

    ///@dev Update the number of the kids with SafeMath to prevent overflows
    ///@param kids the number of kids msg.sender wants to add to his relationship 
    function addKids( uint kids)
    public
    payable
    inRelationship( msg.sender){
        uint newNumberKids = uint256(kids + addressToRelationship[msg.sender].kids);
        addressToRelationship[msg.sender].kids = newNumberKids;  

        emit addMoreKids(newNumberKids);
    }


    ///@dev Functionality enables user to create a proposal to somebody address.  Will implement later ***
    ///@param user the address you want to propose a relationship to
    function preposeARelationship(address user) public payable{
    }

    ///@dev Addresses will be in a relationship if the person to whom was the proposal send acecpts the proposal 
    ///@param user the address you want to accept his/hers proposition for a relationship
    function acceptRelationship(address user) public payable{
    }
}
