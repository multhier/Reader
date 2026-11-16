// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title TreemanCoin (TREEMAN)
/// @notice Fixed-supply ERC-20 token. The whole supply is minted once to the
///         deployer; there is no owner, no minting and no pausing afterwards.
contract TreemanCoin {
    string public constant name = "TreemanCoin";
    string public constant symbol = "TREEMAN";
    uint8 public constant decimals = 18;
    uint256 public constant totalSupply = 1_000_000 * 10 ** 18;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor() {
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address to, uint256 value) external returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    function approve(address spender, uint256 value) external returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) external returns (bool) {
        uint256 allowed = allowance[from][msg.sender];
        if (allowed != type(uint256).max) {
            require(allowed >= value, "TREEMAN: allowance too low");
            allowance[from][msg.sender] = allowed - value;
        }
        _transfer(from, to, value);
        return true;
    }

    function _transfer(address from, address to, uint256 value) private {
        require(to != address(0), "TREEMAN: transfer to zero address");
        uint256 balance = balanceOf[from];
        require(balance >= value, "TREEMAN: balance too low");
        unchecked {
            balanceOf[from] = balance - value;
        }
        balanceOf[to] += value;
        emit Transfer(from, to, value);
    }
}
