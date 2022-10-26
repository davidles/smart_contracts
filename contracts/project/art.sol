// SPDX-License-Identifier: MIT

// Version
pragma solidity ^0.8.0;

import "@openzeppelin/contracts@4.4.2/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.4.2/access/Ownable.sol";

contract ArtToken is ERC721, Ownable{

    // Initial Statement

    // smart contract constructor
    constructor(string memory _name, string memory _symbol)
    ERC721(_name, _symbol){}
}


