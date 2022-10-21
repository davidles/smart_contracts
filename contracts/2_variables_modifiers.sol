// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract variables_modifiers {

    //Valores enteros sin signos

    uint256 a;
    uint8 public b = 3;

    // Valores enteros con signos

    int256 c;
    int8 public d = -32;
    int e = 65;

    // Variable String

    string str;
    string public str_public = "Esto es publico";
    string private str_private = "Esto es privado";

    // Variables booleanas

    bool boolean;
    bool public boolean_public= true;
    bool private boolean_private= false;

    // Variables bytes
    bytes32 first_bytes;
    bytes4 second_bytes;
    bytes1 bytes_1;

    // Algortimo de hash
    bytes32 public hashing = keccak256(abi.encodePacked("Hello Word", uint(10), msg.sender,  0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB));
    /* Funcion keccak256 es la funcion interna que llama al algoritmo de hash en ethereum*/

    bytes32 public hashing_sha256 = sha256(abi.encodePacked("Hello Word"));
    bytes20 public hashing_ripemd160 = ripemd160(abi.encodePacked("Hello Word"));

    // Variables Address

    address my_address;
    address public address1 = 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB;
    address public addres2 = msg.sender;

    // Variable de enumeracion

    enum options {ON, OFF}
    options state;
    options constant defaultChoice = options.OFF;

    function turnOn() public{
        state = options.ON;
    }

    function turnOff() public{
        state = options.OFF;
    }

    function displayState() public view returns(options){
        return state;
    }

}