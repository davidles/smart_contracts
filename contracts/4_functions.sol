// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract functions{

    // funciones de tipo pure

    function getName() public pure returns( string memory ){
        return "Joan";
    }

    // Funciones de tuipo view
    uint256 x = 100;

    /* View: Accedemos a los datos de la blockchain */
    function getnumber() public view returns( uint256 ){
        return x * 2;
    }

    

}