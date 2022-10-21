// SPDX-License-Identifier: MIT

// Version
pragma solidity ^0.8.4;

// Importar un Smart Contract de openZeppeling-contracts

import "@openzeppelin/contracts@4.5.0/token/ERC721/ERC721.sol";

// Declaracion del smart contract

contract FirstContract is ERC721{

    // Direccion de la persona que despliega el contrato
    address public owner;

    /* Almacenar en la variable owner la direccion de la persona
        que despliega el contrato
     */

     constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol){
         /* msg.sender: Funcion interna que me da la direccion que esta ejecutando
         dicha funcion */
         owner = msg.sender;
     }


}