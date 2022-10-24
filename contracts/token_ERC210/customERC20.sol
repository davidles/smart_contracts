// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./ERC-20.sol";

contract customERC20 is ERC20{

    constructor() ERC20("Dave", "DA"){}

    // Creacion de nuevos tokens
    function createTokens() public {
        _mint(msg.sender, 1000);
    }
}