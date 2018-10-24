pragma solidity ^0.4.24;

import "truffle/Assert.sol";
import "../contracts/contract6.sol";

/// @title A contract test urban communication
/// @author Konrad Swiderski

contract contract6test {
    contract6 instance;
    
    /// @notice Add Bus station with all parametrs

    function testAddBusStationCorrect() public {
        instance = new contract6();
        
        Assert.equal(
            instance.addBusStation("xx","ww","1.4","1.5"), 
            true, 
            "Fail"
        );    
    }

    /// @notice Get id bus station (index = 0)

    function testGetBusStationId() public {
        Assert.equal(
            instance.getBusStationId(0), 
            "xx", 
            "Fail"
    ); 
    }

    /// @notice Get name bus station (index = 0)

    function testGetBusStationName() public {
        Assert.equal(
            instance.getBusStationName(0), 
            "ww", 
            "Fail"
    ); 
    }

    /// @notice Get x coordinate bus station (index = 0)

    function testGetBusStationNameXCoordinate() public {
        Assert.equal(
            instance.getBusStationNameXCoordinate(0), 
            "1.4", 
            "Fail"
    ); 
    }

    /// @notice Get y coordinate bus station (index = 0)

    function testGetBusStationNameYCoordinate() public {
        Assert.equal(
            instance.getBusStationNameYCoordinate(0), 
            "1.5", 
            "Fail"
    ); 
    }

    /// @notice Add Bus station without id

    function testAddBusStationWithoutId() public {
        Assert.equal(
            instance.addBusStation("","ww","1.4","1.5"), 
            false, 
            "Fail"
        ); 
    }

    /// @notice Add Bus station without name

    function testAddBusStationWithoutName() public {
        Assert.equal(
            instance.addBusStation("xx","","1.4","1.5"), 
            false, 
            "Fail"
    ); 
    }

    /// @notice Add Bus station without x coordiante

    function testAddBusStationWithoutX() public {
        Assert.equal(
            instance.addBusStation("xx","ww","","1.5"), 
            false, 
            "Fail"
    ); 
    }

    /// @notice Add Bus station without y coordinate

    function testAddBusStationWithoutY() public {
        Assert.equal(
            instance.addBusStation("zz","ww","1.4",""), 
            false, 
            "Fail"
    ); 
    }
}