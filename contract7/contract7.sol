pragma solidity ^0.4.22;

import "./Ownable.sol";

/// @title A contract managers
/// @author Konrad Swiderski

contract contract7 is Ownable {

  //Struct of single manager
  struct manager {
    string name;
    address addressManager;
    uint startTime;
  }

  //Array of managers
  manager[] managers;

  //Mapping with managers (true - if is manager, false not manager)
  mapping(address => bool) managerPermission;

  /// @notice Modifier for only manager
  /// @param _addressManager address of manager

  modifier modManager(address _addressManager) {
    require(managerPermission[_addressManager]);
    _;
  }

  /// @notice Constructor

  constructor() public {
    // Owner is manager
    managers.push(manager("Owner", msg.sender, now)); 
    // Set permission
    managerPermission[msg.sender] = true; 
  }

  /// @notice Add new manager
  /// @param _name name of manager
  /// @param _addressManager address of manager

  function addManager(string _name, address _addressManager) onlyOwner public
  {
    // Already exist?
    require(managerPermission[_addressManager] == false); 
    // Create new manage
    managers.push(manager(_name, _addressManager, now)); 
    // Set permission
    managerPermission[_addressManager] = true; 
  }

  /// @notice Remove manager
  /// @param _addressManager address of manager
 
  function removeManager(address _addressManager) onlyOwner public
  {
    // Exist manager?
    require(managerPermission[_addressManager] == true);  
    
    // Index to remove
    uint indexToRemove = 0; 
    for(uint i = 0; i < managers.length; i++)
    {
      // Find index of manager
      if(_addressManager == managers[i].addressManager) 
      {
        indexToRemove = i;
        break;
      }
    }

    // Copy new array to old
    for(i = uint(indexToRemove); i < managers.length - 1; i++)
        managers[i] = managers[i+1];

    // Update array
    delete managers[managers.length-1];
    managers.length--;
    // Reset permission
    managerPermission[_addressManager] = false; 
  }

  /// @notice Edit existing manager
  /// @param _addressManager address of manager
  /// @param _name new name of manager
  
  function editManager(address _addressManager, string _name) onlyOwner public 
  {
  // Exist manager?
  require(managerPermission[_addressManager] == true); 
  for(uint i = 0; i < managers.length; i++)
    {
        //Find index of manager
        if(_addressManager == managers[i].addressManager) 
            //Change the name of manager
            managers[i].name = _name; 
    }
  }

  /// @notice Get count of managers
  
  function getCountOfManager() view returns(uint)
  {
      return managers.length;
  }

  /// @notice Get name of manager
  /// @param _index index at array of managers
  
  function getName(uint _index) view returns(string)
  {
      return managers[_index].name;
  }
}
