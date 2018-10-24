pragma solidity ^0.4.24;

/// @title A contract balance checker
/// @author Konrad Swiderski
/// @notice This contract show address and balance of contract, owner, caller

contract contract1{
    address public owner;
    address private addressContract;

    /// @notice Constructor sets owner address

    constructor() public
    {
        owner = msg.sender;   
    }

    /// @notice Get address of Contract
    /// @return Address

    function getAddressOfContract() view public returns(address)
    {
      return address(this);
    }

    /// @notice Get address of Owner
    /// @return Address

    function getAddressOfOwner() view public returns(address)
    {
      return owner;
    }

    /// @notice Get address of Caller
    /// @return Address

    function getAddressOfCaller() view public returns(address)
    {
      return msg.sender;
    }

    /// @notice Get balance of Contract
    /// @return balance

    function getBalanceOfContract() view public returns(uint256)
    {
      return address(this).balance;
    }

    /// @notice Get balance of Owner
    /// @return balance

    function getBalanceOfOwner() view public returns(uint256)
    {
      require(owner == msg.sender, "Only Owner!");
      return owner.balance;
    }

    /// @notice Get balance of Caller
    /// @return balance

    function getBalanceOfCaller() view public returns(uint256)
    {
      return msg.sender.balance;
    }
}