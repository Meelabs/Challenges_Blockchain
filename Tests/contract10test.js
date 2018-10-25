const contract10 = artifacts.require("contract10");

/// @title A contract test election
/// @author Konrad Swiderski

contract('contract10', async (accounts) => {
    let instance;

    /// @notice Initialize instance

    beforeEach(async () => {
        instance = await contract10.deployed();
    });

    /// First set of tests

    describe('test basic methods', async () => {
        it("test add candidate", async () => {
            // Assign Address and name of candidate
            await instance.addCandidate(accounts[1],"John");
            // How many candidates?
            assert.equal(await instance.getLenOfCandidates(), 1, "The number of candidates is not correct"); 
        });
        it("test name candidate", async () => {
            // Check name of candidate
            assert.equal(await instance.getNameOfCandidate(accounts[1]), "John", "The name is not correct"); 
        });
        it("test add voter", async () => {
            await instance.addVoter(accounts[0]);
            // How many voters?
            assert.equal(await instance.getLenOfVoters(), 1, "The number of voters is not correct"); 
        });
        it("test vote", async () => {
            // Vote from voter (address(this))
            await instance.vote(accounts[1], { from: accounts[0] }); 
            // Check count of votes
            assert.equal(await instance.getCountOfVotesOfCandidate(accounts[1]), 1, "The count of votes is not correct"); 
        });
        it("test address of winner", async () => {
            // Check address of winner
            assert.equal(await instance.getAddressOfWinner(), accounts[1], "The address of winner is not correct"); 
        });
        it("test name of winner", async () => {
            // Check name of winner
            assert.equal(await instance.getNameOfWinner(), "John", "The name of winner is not correct"); 
        });
    });
});