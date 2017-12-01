pragma solidity ^0.4.4;

import "./ERC20Token.sol";

contract TokenFactory {

    function newToken(string symbol, string name, uint8 decimals, uint256 totalSupply) returns (address tokenAddress) {

        return new ERC20Token(msg.sender, symbol, name, decimals, totalSupply);

    }

}