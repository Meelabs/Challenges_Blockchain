pragma solidity ^0.4.24;

import "truffle/Assert.sol";
import "../contracts/contract7.sol";

/// @title A contract test managers
/// @author Konrad Swiderski

contract contract7test {
    contract7 private contract7instance;

    /// Initalize contract7 instance

    constructor() public {
        contract7instance = new contract7();
    }

    /// Test add manager

    function testAddManager() public {
        contract7instance.addManager("John",0x3d83B2A6aB4fc91815a01203C5C980CF578CCF59);
        // 2 Because, first is owner
        Assert.equal(contract7instance.getCountOfManager(), 2, "The number of managers is not correct"); 
    }

    /// Test name of manager

    function testNameManager() public {
        // Check name
        Assert.equal(contract7instance.getName(1), "John", "The name of the manager is not correct"); 
    }

    /// Test edit manager

        function testEditManager() public {
        contract7instance.editManager(0x3d83B2A6aB4fc91815a01203C5C980CF578CCF59, "Michael");
        // Check new name
        Assert.equal(contract7instance.getName(1), "Michael", "The name of the manager is not correct"); 
    }

    /// Test remove manager

        function testRemoveManager() public {
        contract7instance.removeManager(0x3d83B2A6aB4fc91815a01203C5C980CF578CCF59);
        // Delete manager, so count is equal 1
        Assert.equal(contract7instance.getCountOfManager(), 1, "The number of managers is not correct"); 
    }
}