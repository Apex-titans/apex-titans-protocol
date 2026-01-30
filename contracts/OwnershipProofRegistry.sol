// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title OwnershipProofRegistry (Apex Titans v0.x demo)
/// @notice Demo contract: stores ownership-proof commitments on-chain.
/// @dev This is NOT a bridge. It does not move assets. It only records proof hashes.
contract OwnershipProofRegistry {
    struct ProofMeta {
        address owner;
        uint64  createdAt;
        bool    exists;
    }

    // commitment => metadata
    mapping(bytes32 => ProofMeta) public proofs;

    event ProofCommitted(bytes32 indexed commitment, address indexed owner, uint64 createdAt);

    /// @notice Commit a proof hash (commitment) to the registry
    /// @param commitment keccak256 hash computed off-chain from proof inputs
    function commitProof(bytes32 commitment) external {
        require(commitment != bytes32(0), "bad commitment");
        require(!proofs[commitment].exists, "already committed");

        proofs[commitment] = ProofMeta({
            owner: msg.sender,
            createdAt: uint64(block.timestamp),
            exists: true
        });

        emit ProofCommitted(commitment, msg.sender, uint64(block.timestamp));
    }

    /// @notice Check if a commitment exists and return the owner
    function getOwner(bytes32 commitment) external view returns (address) {
        ProofMeta memory p = proofs[commitment];
        require(p.exists, "not found");
        return p.owner;
    }
}
