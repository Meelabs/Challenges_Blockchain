pragma solidity ^0.4.22;

/// @title A contract fundraising
/// @author Konrad Swiderski

contract contract3 {

  /// Members
  address private owner;
  uint lastUpdate;
  uint fundation = 3 ether;
  uint timeLimit = 20 seconds;
  mapping(address => uint) payments;
    
  constructor() public {
    owner = msg.sender; 
    lastUpdate = now;
  }
  
  /// @notice pay money to fundation
  
  function pay() public payable {
    // Save information about payments
    payments[msg.sender] = msg.value;
      
    // Check minimum value of fundation
    if(address(this).balance >= fundation)
    {
        // Send money to owner
        getMoneyFromFundation();
    }
  }

  /// @notice transfer money to owner

  function getMoneyFromFundation() private{
    owner.transfer(address(this).balance);
  }
  
  /// @notice transfer my money to me
  
  function getMyMoney() public {
    // Check timeLimit and limit of fundation (is reached or not?)
    if((now >= (lastUpdate + timeLimit)) && (address(this).balance < fundation))
        msg.sender.transfer(payments[msg.sender]);
  }
}