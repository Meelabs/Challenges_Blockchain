pragma solidity ^0.4.24;

import "truffle/Assert.sol";
import "../contracts/contract10.sol";

/// @title A contract test election
/// @author Konrad Swiderski

contract contract10test {
    contract10 private contract10instance;

    /// Initalize contract10 instance

    constructor() public {
        contract10instance = new contract10();
    }

    /// Test add candidate

    function testAddCandidate() public {
        // Assign Address and name of candidate
        contract10instance.addCandidate(0x3d83B2A6aB4fc91815a01203C5C980CF578CCF59,"John"); 
        // How many candidates?
        Assert.equal(contract10instance.getLenOfCandidates(), 1, "The number of candidates is not correct"); 
    }

    /// Test name candidate

    function testNameCandidate() public {
        // Check name of candidate
        Assert.equal(contract10instance.getNameOfCandidate(0x3d83B2A6aB4fc91815a01203C5C980CF578CCF59), "John", "The name is not correct"); 
    }

    /// Test add voter

    function testAddVoter() public {
        contract10instance.addVoter(address(this));
        // How many voters?
        Assert.equal(contract10instance.getLenOfVoters(), 1, "The number of voters is not correct"); 
    }

    /// Test vote

    function testVote() public {
        // Vote from voter (address(this))
        contract10instance.vote(0x3d83B2A6aB4fc91815a01203C5C980CF578CCF59); 
        // Check count of votes
        Assert.equal(contract10instance.getCountOfVotesOfCandidate(0x3d83B2A6aB4fc91815a01203C5C980CF578CCF59), 1, "The count of votes is not correct"); 
    }

    /// Test address of winner

    function testGetAddressOfWinner() public {
        // Check addres of winner
        Assert.equal(contract10instance.getAddressOfWinner(), 0x3d83B2A6aB4fc91815a01203C5C980CF578CCF59, "The address of winner is not correct"); 
    }

    /// Test name of winner

    function testGetNameOfWinner() public {
        // Check name of winner
        Assert.equal(contract10instance.getNameOfWinner(), "John", "The name of winner is not correct"); 
    }
}