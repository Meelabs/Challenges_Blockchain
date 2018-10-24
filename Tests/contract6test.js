const contract6 = artifacts.require("contract6");

/// @title A contract test urban communication
/// @author Konrad Swiderski

contract('contract6', async (accounts) => {
    let instance; 

    /// @notice Initialize instance

    beforeEach(async () => {
        instance = await contract6.deployed();
    });

    /// First set of tests (constructor)

    describe('test constructor', async () => {
        it("chceck owner address", async () => {
            let ownerAddress = await instance.owner.call();
            assert.equal(ownerAddress, accounts[0]);
        });
    });

    /// Second set of tests (addBusStation)

    describe('test addBusStation', async () => {
        it("Owner adds new bus station", async () => {
            await instance.addBusStation("aa", "bb", "2.2", "3.3"); // Run as owner
            
            // Check returned values
            assert.equal(await instance.getBusStationId(0), "aa"); //Id
            assert.equal(await instance.getBusStationName(0), "bb");  //Name
            assert.equal(await instance.getBusStationNameXCoordinate(0), "2.2"); //X coordinate 
            assert.equal(await instance.getBusStationNameYCoordinate(0), "3.3"); //Y coordinate
        });

        it("Not owner adds new bus station", async () => {
            try {
                // Run as not owner
                await instance.addBusStation("cc", "dd", "4.2", "4.3", { from: accounts[1]}); 
                // Internal throw (transaction revert)
            } catch (err) {
                console.log(err.message);
                // Set this test is correct (revert, because not owner calls method addBustStation)
                assert.ok(true); 
                //OR assert.ok(/revert/.test(err.message)); //Check error message - (this message containts revert transaction?)
            }
        });
    });
});