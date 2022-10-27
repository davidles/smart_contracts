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

    // NFT Token Price Update
    function updateFee(uint256 _fee) external onlyOwner{
        fee = _fee;
    }

    // Visualize the balance of the Smart Contract ( ehters )
    function infoSmartContract() public view returns(address, uint256){
        address SC_address = address(this);
        uint256 SC_money = address(this).balance / 10**18;
        return (SC_address, SC_money);
    }

    // Obtaining all created NFT tokens (artwork)
    function getArtWorks() public view returns (Art [] memory){
        return art_works;
    }

    // Obtaining a user's NFTs tokens
    function getOwnerArtWork(address _owner) public view returns (Art [] memory){
        //Almaceno obras de arte
        Art [] memory result = new Art[](balanceOf(_owner));
        uint256 counter_owner = 0;
        for (uint256 i = 0; i < art_works.length; i++){
            // si la obra de arte == propiedad del dueño
            if(ownerOf(i) == _owner){
                // guardo en la posicion == la obra de arte
                result[counter_owner] = art_works[i];
                counter_owner++;
            }
        } 
        return result;
    }

    //==========================
    // NFT Token Development
    //==========================

    //NFT token payable
    function createRandomArtWork(string memory _name) public payable {
        require(msg.value >= fee);
        _createArtWork(_name);
    }    

    // Extraction of ethers from the Smart Contract to the Owner
    function withdraw() external payable onlyOwner{
        address payable _owner = payable(owner());
        _owner.transfer(address(this).balance);
    }

}


