pragma solidity ^0.4.24;

/// @title A contract election
/// @author Konrad Swiderski

contract contract10 {

  address owner;
  address public winnerAddress;
  string public winnerName;
  uint officialNumberOfVotes = 0;
  // The highest score in candidates
  uint max = 0; 

  // Struct of candidate
  struct candidate {
    string name;
    uint countOfVotes;
  }

  // Array of addresses of candidates
  address[] public candidates;
  // Mapping address to struct of single candidate - to store information
  mapping(address => candidate) public candidatesInfo;

  // Array of addresses of voters
  address[] public voters;
  // Mapping address to bool - to store permission
  mapping(address => bool) votersPermission;

  // Get length of candidates
  function getLenOfCandidates() public view returns(uint) {
    return candidates.length;
  }

  // Get length of voters
    function getLenOfVoters() public view returns(uint) {
    return voters.length;
  }

  // Get name of candidate
    function getNameOfCandidate(address _address) public view returns(string) {
    return candidatesInfo[_address].name;
  }
  

  // Get count of votes of candidate
    function getCountOfVotesOfCandidate(address _address) public view returns(uint) {
    return candidatesInfo[_address].countOfVotes;
  }

  // Get address of winner
    function getAddressOfWinner() public view returns(address) {
    return winnerAddress;
  }

  // Get name of winner
    function getNameOfWinner() public view returns(string) {
    return winnerName;
  }

  /// @notice Constructor set member

  constructor() {
    owner = msg.sender;
  }

  /// @notice Get winner

  function getWinner() private {
    //F ind the highest score
    for(uint i = 0; i < candidates.length; i++) 
    {
        if(candidatesInfo[candidates[i]].countOfVotes >= max)
        {
          // Assing the highest score and winner
          max = candidatesInfo[candidates[i]].countOfVotes;
          winnerAddress = candidates[i];
          winnerName = candidatesInfo[candidates[i]].name;
        }
    }
  }

  /// @notice Add candidate
  /// @param _address address of candidate
  /// @param _name name of candidate

  function addCandidate(address _address, string _name) public {
    // Only owner
    require(msg.sender == owner, "Only owner"); 

    // Check if candidate is on the list
    for(uint i = 0; i < candidates.length; i++) 
      if(candidates[i] == _address)
        return;
    // Add new candidate
    candidates.push(_address); 
    // Assign information
    candidatesInfo[_address] = candidate(_name, 0); 
  }

  /// @notice Add voter
  /// @param _address address of voter

  function addVoter(address _address) public {
    // Only owner
    require(msg.sender == owner, "Only owner"); 

    // Check if voter is on the list
    for(uint i = 0; i < voters.length; i++) 
      if(voters[i] == _address)
        return;
    // Add new voter
    voters.push(_address); 
    // Assign permission
    votersPermission[_address] = true; 
  }

  /// @notice Vote to somebody
  /// @param _address address of candidate

  function vote(address _address) public {
    // Have permission or not?
    require(votersPermission[msg.sender], "you've already voted"); 
    // Check addresses of msg.sender and _address
    require(msg.sender != _address, "you cant vote for yourself"); 
    // This address is on the list of candidates?
    for(uint i = 0; i < candidates.length; i++) 
      if(candidates[i] == _address)
      {
        // Turn off permission
        votersPermission[msg.sender] = false; 
        // Increment count of votes
        candidatesInfo[_address].countOfVotes++; 
        // Increment official count of votes
        officialNumberOfVotes++; 
        // Everyone gave the vote?
        if(officialNumberOfVotes == voters.length) 
          // Get winner
          getWinner(); 
        return;
      }
  }
}
