Inheritance and Interfaces (Importing and extending contracts and/or using contract interfaces) Inheritances and Interfaces  
Have used inheritance to derive contract state and functions from a verified and audited source (OpenZeppelin). Inherited contracts include:
- Math owerflow problem (SafeMath.sol) for adding the kids.
- counters for the relationship id increment (utils/Counters.sol)
- for the access control i am using Ownable(Ownable.sol) and Pausable(Pausable.sol)
- for the security perpuses (security/ReantrancyGuard.sol)


Access Control Design Patterns (Restricting access to certain functions using things like Ownable, Role-based Control) Access Control Design Patterns
- Using Ownable with onlyOwner modifier for setting the cut that the contract gets for every created relationship. Future work
- Using Pausable with whenNotPaused modifier to implement an emergency stop mechanism that can be triggered by an authorized account.

Optimizing Gas (Creating more efficient Solidity code)
- i did not use loops so i avoided the expensive operations in loops
- i did not use arrays so i avoided non fixed array size 
- i reduced expensive operations in the contract's functions
