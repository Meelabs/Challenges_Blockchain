pragma solidity ^0.4.24;

/// @title A contract test own converter
/// @author Konrad Swiderski

// Import Assert.sol
import "truffle/Assert.sol"; 
// Import destination file
import "../contracts/contract5.sol"; 

contract contract5test {
    // Member instance of destination file
    contract5 instance; 
    
    /// @notice Function to test convertStringToByte32

    function testConvertStringToByte32() public {
        // Initalize member
        instance = new contract5(); 
        
        //Test 
        Assert.equal(
            instance.convertStringToByte32("Konrad"), 
            0x4b6f6e7261640000000000000000000000000000000000000000000000000000, 
            "Doesn't work!"
        );    
    }
}