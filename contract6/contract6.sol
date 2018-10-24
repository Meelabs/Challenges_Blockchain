pragma solidity ^0.4.24;

/// @title A contract urban communication
/// @author Konrad Swiderski

contract contract6 {
    
    address owner;

    // Struct of bus station
    struct busStation {
        string id;
        string name;
        string xCoordinate;
        string yCoordinate;
    }

    busStation[] listOfBusStatation;
    
    constructor() public {
        owner = msg.sender;
    }

    /// @notice Add bus station
    /// @param _id id of bus station
    /// @param _name name of bus station
    /// @param _xCoordinate x coordinate of bus station
    /// @param _yCoordinate y coordinate of bus station
    /// @return bool success or not?
    
    function addBusStation(string _id, string _name, string _xCoordinate, string _yCoordinate) public returns(bool)
    {
        require(msg.sender == owner, "You dont have permission!"); //Only owner

        // Check parameters
        if(bytes(_id).length > 0 && bytes(_name).length > 0 && 
        bytes(_xCoordinate).length > 0 && bytes(_yCoordinate).length > 0)
        {
            listOfBusStatation.push(busStation(_id, _name, _xCoordinate, _yCoordinate));
            // Success
            return true; 
        }
        else
            //Fail
            return false;
    }
    
    /// @notice Get id bus station
    /// @param _number index at array
    /// @return id

    function getBusStationId(uint _number) public view returns(string) {
        require(_number < listOfBusStatation.length, "Wrong index!");
        return listOfBusStatation[_number].id;
    }

    /// @notice Get name bus station
    /// @param _number index at array
    /// @return name

    function getBusStationName(uint _number) public view returns(string) {
        require(_number < listOfBusStatation.length, "Wrong index!");
        return listOfBusStatation[_number].name;
    }

    /// @notice Get x coordinate bus station
    /// @param _number index at array
    /// @return x coordiante

    function getBusStationNameXCoordinate(uint _number) public view returns(string) {
        require(_number < listOfBusStatation.length, "Wrong index!");
        return listOfBusStatation[_number].xCoordinate;
    }

    /// @notice Get y coordinate bus station
    /// @param _number index at array
    /// @return y coordiante

    function getBusStationNameYCoordinate(uint _number) public view returns(string) {
        require(_number < listOfBusStatation.length, "Wrong index!");
        return listOfBusStatation[_number].yCoordinate;
    }
}