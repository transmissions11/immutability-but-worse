// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.10;

interface Governance {
    function castVoteWithReason(
        uint256 proposalId,
        uint8 support,
        string memory reason
    ) external;
}

contract ImmutabilityButWorse {
    string public constant WHY_I_VOTED_NO = "no.";

    event VotedNo(Governance gov, uint256 id);

    function voteNo(Governance gov, uint256 id) external {
        gov.castVoteWithReason(id, 0, WHY_I_VOTED_NO);

        emit VotedNo(gov, id);
    }
}
