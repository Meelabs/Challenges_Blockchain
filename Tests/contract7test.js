const contract7 = artifacts.require("contract7");

/// @title A contract test managers
/// @author Konrad Swiderski

contract('contract7', async (accounts) => {
    let instance; 

    /// @notice Initialize instance

    beforeEach(async () => {
        instance = await contract7.deployed();
    });

    /// First set of tests

    describe('test methods to manage managers', async () => {
        it("test add manager", async () => {
            instance.addManager("John",0x3d83B2A6aB4fc91815a01203C5C980CF578CCF59);
            // 2 Because, first is owner
            assert.equal(await instance.getCountOfManager(), 2, "The number of managers is not correct"); 
        });
        it("test name manager", async () => {
          //Check name
          assert.equal(await instance.getName(1), "John", "The name of the manager is not correct"); 
      });
        it("test edit manager", async () => {
            instance.editManager(0x3d83B2A6aB4fc91815a01203C5C980CF578CCF59, "Michael");
            // Check new name
            assert.equal(await instance.getName(1), "Michael", "The name of the manager is not correct"); 
        });
        it("test remove manager", async () => {
          instance.removeManager(0x3d83B2A6aB4fc91815a01203C5C980CF578CCF59);
            // Delete manager, so count is equal 1
            assert.equal(await instance.getCountOfManager(), 1, "The number of managers is not correct"); 
      });
    });
});