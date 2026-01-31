// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title OwnershipProofRegistry (Apex Titans v0.x)
/// @notice Stores ownership proofs as commitments (no bridges, no wrapped tokens)
contract OwnershipProofRegistry {
    struct Proof {
        address owner;
        uint64 timestamp;
    }

    mapping(bytes32 => Proof) public proofs;

    event ProofCommitted(bytes32 indexed commitment, address indexed owner, uint64 timestamp);

    function commitProof(bytes32 commitment) external {
        require(commitment != bytes32(0), "invalid");
        require(proofs[commitment].owner == address(0), "exists");

        proofs[commitment] = Proof({
            owner: msg.sender,
            timestamp: uint64(block.timestamp)
        });

        emit ProofCommitted(commitment, msg.sender, uint64(block.timestamp));
    }
}
