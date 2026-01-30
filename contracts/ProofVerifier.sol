// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IOwnershipProofRegistry {
    function proofs(bytes32 commitment) external view returns (address owner, uint64 createdAt, bool exists);
}

/// @title ProofVerifier (Apex Titans v0.x demo)
/// @notice Verifies that a proof commitment exists in a registry and prevents replay.
/// @dev In v0.x this is a demo. Later it upgrades to light-client / ZK verification.
contract ProofVerifier {
    IOwnershipProofRegistry public immutable registry;

    // commitment => used
    mapping(bytes32 => bool) public used;

    event ProofVerified(bytes32 indexed commitment, address indexed claimer);

    constructor(address registryAddress) {
        require(registryAddress != address(0), "bad registry");
        registry = IOwnershipProofRegistry(registryAddress);
    }

    /// @notice Verify a commitment and mark it as used (anti-replay)
    function verifyAndConsume(bytes32 commitment) external {
        require(commitment != bytes32(0), "bad commitment");
        require(!used[commitment], "already used");

        (address owner,, bool exists) = registry.proofs(commitment);
        require(exists, "not committed");
        require(owner == msg.sender, "not owner");

        used[commitment] = true;
        emit ProofVerified(commitment, msg.sender);
    }
}
