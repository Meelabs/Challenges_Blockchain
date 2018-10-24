pragma solidity ^0.4.22;

/// @title A contract own implementation ERC20 token
/// @author Konrad Swiderski

contract contract4 {
    
  /// Members
  string public name; 
  string public symbol;
  uint8 public decimals; 
  uint public totalSupply;
  uint initalNumberOfTokens;
  mapping(address => uint) balance;
  mapping(address => mapping(address => uint)) permission;
                                                           
  /// Events
  event Transfer(address indexed _from, address indexed _to, uint _value);
  event Approval(address indexed _from, address indexed _spender, uint _value);
  
  constructor(string _name, 
              string _symbol, 
              uint8 _decimals, 
              uint _totalSupply,
              uint _initalNumberOfTokens) 
              public {
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
    totalSupply = _totalSupply;
    initalNumberOfTokens = _initalNumberOfTokens;
    balance[msg.sender] = initalNumberOfTokens;
  }
  
  /// Functions
  
  /// @notice Get balance of passed address
  /// @param _owner address of account
  /// @return number of tokens
  
  function balanceOf(address _owner) public view returns(uint) {
      return balance[_owner];
  }
  
  /// @notice send tokens to passed address
  /// @param _to address of account
  /// @return success or not
  
  function transfer(address _to, uint _value) public returns(bool) {
      if(balance[msg.sender] > _value && msg.sender != _to)
      {
          balance[msg.sender] -= _value;
          balance[_to] += _value;
          
          // Fire Event
          emit Transfer(msg.sender, _to, _value);
          return true;
      }
      else
          return false;
      
  }
  
  /// @notice send tokens from first passed address to second passed address
  /// @param _from address of account
  /// @param _to address of account
  /// @return success or not
  
  function transferFrom(address _from, address _to, uint _value) public returns(bool) {
      if(balanceOf(_from) >= _value && allowance(_from, _to) >= _value && _from != _to)
      {
          balance[_from] -= _value;
          balance[_to] += _value;
          permission[_from][_to] -= _value;
          
          // Fire Event
          emit Transfer(_from, _to, _value);
          return true;
      }
      else
          return false;
  }
  
  /// @notice Aprove tokens to passed address
  /// @param _spender address of account
  /// @return success or not
  
  function approve(address _spender, uint _value) public returns(bool) {
    if(balanceOf(msg.sender) >= _value && msg.sender != _spender)
    {
        permission[msg.sender][_spender] = _value;
        
        // Fire Event
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
    else
        return false;
  }
  
  /// @notice Get information about permission to tokens
  /// @param _owner address of account
  /// @param _spender address of account
  /// @return number of tokens
  
  function allowance(address _owner, address _spender) view public returns(uint) {
      return permission[_owner][_spender];
  }
}