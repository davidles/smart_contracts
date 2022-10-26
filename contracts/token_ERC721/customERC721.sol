// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// Persona 1 (Owner) :0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// Persona 2 (Operador): 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2

// Importacion de smart contracts de OppenZeppelin
import "@openzeppelin/contracts@4.5.0/token/ERC721/ERC721.sol";
/**
Necesitamos un contador ( ya provisto por OZ ) para darle el Id a los NFTs
*/
import "@openzeppelin/contracts@4.5.0/utils/Counters.sol";

contract erc721 is ERC721{

    // Contadores para los IDs de los NFTs
    using Counters for Counters.Counter;
    Counters.Counter private _tokensIds;

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol){}

    // Envio de NFTs
    function sendNFT(address _account) public {
        _tokensIds.increment();
        uint256 newItemId = _tokensIds.current();
        _safeMint(_account, newItemId);
    }

}