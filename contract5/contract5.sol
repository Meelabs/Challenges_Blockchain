pragma solidity ^0.4.24;

/// @title A contract own converter string to base32
/// @author Konrad Swiderski

contract contract5 {

    /// @notice Convert passed string to bytes32

    function convertStringToByte(string _input) public pure returns (bytes32) {
    bytes32 output;
    
    // Empty or not?
    if (bytes(_input).length == 0) 
        return 0x0;

    // Implement Asembly block with assembly functions
    assembly { 
        output := mload(add(_input, 32)) 
    }
    
    return output;
    }
}