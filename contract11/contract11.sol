pragma solidity ^0.4.22;

/// @title A contract tic tac toe game
/// @author Konrad Swiderski

contract contract11 {
  
  // Address of player1
  address  player1; 
  // Player1 trun
  bool player1turn = true; 
  // Address of player2
  address player2; 
  // Player2 turn
  bool player2turn; 
  // Count of players
  uint countOfPlayers = 0; 
  // Board
  uint[3][3] board;
  // Address of winner
  address public addressOfWinner; 
  // Name of winner
  uint public nameOfWinner; 

  /// @notice join to game

  function joinToTheGame() public payable {
    // Set player1
    if(countOfPlayers == 0) 
    {
      //Check ether
      require(msg.value >= 1 ether, "Not enoguht ether"); 
      player1 = msg.sender;
      countOfPlayers++;
      return;
    }
    // Set player2
    if(countOfPlayers == 1 && msg.sender != player1) 
    {
      // Check ether
      require(msg.value >= 1 ether, "Not enoguht ether"); 
      player2 = msg.sender;
      countOfPlayers++;
    }
  }

  /// @notice Make a move
  /// @param _x x coordinate
  /// @param _y y coordinate

  function makeAMove(uint _x, uint _y) public {
    // Check count of players
    require(countOfPlayers == 2, "Not enoguht players"); 
    // Check range of x
    require(_x >=0 && _x <= 2, "Invalid x"); 
    // Check range of y
    require(_y >=0 && _y <= 2, "Invalid y"); 
    // Player1 turn?
    if(player1turn) 
    {
      // Check address player
      require(player1 == msg.sender, "Player number 1 has a move!"); 
      // This field if is empty?
      require(board[_x][_y] == 0, "This field is not empty"); 
      board[_x][_y] = 1; //Mark field
      // Reset and set flags contained with sequence
      player1turn = false;
      player2turn = true;

      // This is winner?
      if(getWinner() == 1) 
      {
        // Set winner
        addressOfWinner = player1;
        nameOfWinner = 1;
        // Transfer money to winner
        addressOfWinner.transfer(address(this).balance); 
      }

      return;
    }
    // Player1 turn?
    if(player2turn) 
    {
      // Check address player
      require(player2 == msg.sender, "Player number 2 has a move!"); 
      // This field if is empty?
      require(board[_x][_y] == 0, "This field is not empty"); 
      // Mark field
      board[_x][_y] = 2; 
      // Reset and set flags contained with sequence
      player1turn = true;
      player2turn = false;

      // This is winner?
      if(getWinner() == 2) 
      {
        // Set winner
        addressOfWinner = player2;
        nameOfWinner = 2;
        addressOfWinner.transfer(address(this).balance); //Transfer money to winner
      }
    }
  }

  /// @notice Check configuration of fields to find winner

  function getWinner() private view returns(uint){
    if(board[0][0] == board[0][1] && board[0][1] == board[0][2])
      return board[0][0];
    if(board[1][0] == board[1][1] && board[1][1] == board[1][2])
      return board[1][0];
    if(board[2][0] == board[2][1] && board[2][1] == board[2][2])
      return board[2][0];
    if(board[0][0] == board[1][0] && board[1][0] == board[2][0])
      return board[0][0];
    if(board[0][1] == board[1][1] && board[1][1] == board[2][1])
      return board[0][1];
    if(board[0][2] == board[1][2] && board[1][2] == board[2][2])
      return board[0][2];
    if(board[0][0] == board[1][1] && board[1][1] == board[2][2])
      return board[0][0];
    if(board[0][2] == board[1][1] && board[1][1] == board[2][0])
      return board[0][2];
  }

  /// @notice Display board

  function displayTable() public view returns(uint, uint, uint, uint, uint, uint, uint, uint, uint) {
    return (board[0][0], board[0][1], board[0][2], board[1][0], board[1][1], board[1][2], board[2][0], board[2][1], board[2][2]);
  }

  /// @notice Reset game

  function resetAll() public {
    player1 = 0;
    player1turn = true;
    player2 = 0;
    player2turn = false;
    countOfPlayers = 0;

    // Clear board
    for (uint i = 0; i < 3; i++)
      for (uint j = 0; j < 3; j++)
          board[i][j] = 0;

    addressOfWinner = 0;
    nameOfWinner = 0;
  }
}