pragma solidity ^0.4.18;
import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

/// @title A contract oraclize communication - get lpg price
/// @author Konrad Swiderski

contract contract8 is usingOraclize {
    string public lpgPrice;

    ///Receive data and save to member

    function __callback(bytes32 myid, string result) {
        lpgPrice = result;
    }

    /// @notice Send query

    function update() payable public {
        oraclize_query("URL", "xml(https://www.fueleconomy.gov/ws/rest/fuelprices).fuelPrices.lpg");
    }
}