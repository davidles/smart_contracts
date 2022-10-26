// SPDX-License-Identifier: MIT

// Version
pragma solidity ^0.8.0;

import "@openzeppelin/contracts@4.4.2/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.4.2/access/Ownable.sol";

contract ArtToken is ERC721, Ownable{

    //==========================
    // Initial Statement
    //==========================


    // smart contract constructor
    constructor(string memory _name, string memory _symbol)
    ERC721(_name, _symbol){}

    // NFT token counter
    uint COUNTER;

    // Price od NFT Tokens (price of the artwork)
    uint fee = 5 ether;

    // Data structure with the properties of the artwork
    struct Art{
        string name;
        uint id;
        uint dna;
        uint level;
        uint rarity;
    }

    // Storage structture for keeping artworks
    Art [] public art_works;

    //Declaration of an event
    event NerArtWork (address indexed owner, uint256 id, uint256 dna);

    //==========================
    // Help functions
    //==========================

    // creation of random number ( required for NFT token properties
    function _createRandomNum(uint256 _mod) internal view returns (uint256){
        bytes32 has_randomNum = keccak256(abi.encodePacked(block.timestamp, msg.sender));
        uint256 randomNum = uint256(has_randomNum);
        return randomNum % _mod; 
    }

    // NFT Token Creation (ArtWork)
    function _createArtWork(string memory _name) internal{
        uint randRarity = uint8(_createRandomNum(1000));
        uint256 randDna = _createRandomNum(10**6);
        Art memory newArtWork = Art(_name, COUNTER, randDna, 1, randRarity);
        art_works.push(newArtWork);
        //Funcion internal para creacion de NFTs
        _safeMint(msg.sender, COUNTER);
        emit NerArtWork(msg.sender, COUNTER, randDna);
        COUNTER++;
    }


}


