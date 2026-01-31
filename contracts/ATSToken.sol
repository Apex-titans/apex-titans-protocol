// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Apex Titans Token (ATS) - fixed supply
contract ATSToken {
    string public name = "Apex Titans";
    string public symbol = "ATS";
    uint8 public decimals = 18;

    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(address initialHolder) {
        require(initialHolder != address(0), "holder=0");
        totalSupply = 5_000_000 * 10 ** uint256(decimals);
        balanceOf[initialHolder] = totalSupply;
        emit Transfer(address(0), initialHolder, totalSupply);
    }

    function transfer(address to, uint256 value) external returns (bool) {
        require(to != address(0), "to=0");
        require(balanceOf[msg.sender] >= value, "balance");
        unchecked {
            balanceOf[msg.sender] -= value;
            balanceOf[to] += value;
        }
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function approve(address spender, uint256 value) external returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) external returns (bool) {
        require(to != address(0), "to=0");
        uint256 allowed = allowance[from][msg.sender];
        require(allowed >= value, "allowance");
        require(balanceOf[from] >= value, "balance");
        unchecked {
            allowance[from][msg.sender] = allowed - value;
            balanceOf[from] -= value;
            balanceOf[to] += value;
        }
        emit Transfer(from, to, value);
        return true;
    }
}
