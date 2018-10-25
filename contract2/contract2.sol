pragma solidity ^0.4.22;

/// @title A contract lottery
/// @author Konrad Swiderski
/// @notice Lottery - no limit of participants

contract contract2 {

  /// Members
  address private owner;
  uint private countOfParticipants = 0;
  address[] participants;

  constructor() public {
    owner = msg.sender; 
  }

  /// @notice Join to lottery, payable function (0.1 ehter)

  function takePart() public payable {

    // Check ether
    require(msg.value == 1 ether);
    
    // Set address of participant
    participants.push(msg.sender);

    // Increment number of participants
    countOfParticipants++;
  }

  /// @notice Owner starts lottery

  function startLottery() public {
    // This is owner?
    require(msg.sender == owner);
    
    // Index of array is random winner
    uint indexWinner = uint(keccak256(block.timestamp, msg.sender, block.difficulty)) % countOfParticipants;
    
    // Transfer ether to winner
    participants[indexWinner].transfer(address(this).balance);
    delete participants;
  }
}