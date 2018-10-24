pragma solidity ^0.4.24;
import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

/// @title A contract oraclize communication - random numbers
/// @author Konrad Swiderski

contract contract9 is usingOraclize {
    uint public randomNumber;
    uint range = 100;
    
    constructor() payable {
        // Set authenticity proof
        oraclize_setProof(proofType_Ledger); 
    }
    
    /// @notice Recive data and save to member

    function __callback(bytes32 myid, string result, bytes proof) {
        // Check addres
        if (msg.sender != oraclize_cbAddress()) throw; 
        
        // Check authenticity proof
        if (oraclize_randomDS_proofVerify__returnCode(myid, result, proof) != 0) 
        {
            // Fail
        } 
        else 
            // Correct, create hash. and use modulo to get correct range
            randomNumber = uint(sha3(result)) % range;
    }

    //// @notice Sending query

    function update() payable public {
        // How many random bytes we need?
        uint N = 4; 
        // Amount of gas we want Oraclize to set for the callback function
        uint callbackGas = 200000; 
        // This function internally generates the correct oraclize_query and returns its queryId
        bytes32 queryId = oraclize_newRandomDSQuery(0, N, callbackGas); 
    }
}