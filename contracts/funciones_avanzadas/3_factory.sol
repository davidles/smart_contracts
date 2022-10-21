// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract Padre {

    // Almacenamiento de la informacion del Factory
    mapping(address => address) public personal_contract;

    // Emision de los nuevos smart contracts
    function Fatory() public {
        address addr_personal_contract = address( new Hijo(msg.sender, address(this)));
        personal_contract[msg.sender] = addr_personal_contract;
    }

}

contract Hijo {
    //Estructura de datos del propietario
    Owner public propietario;
    struct Owner{
        address _owner;
        address _smartcontractPadre;
    }
    // Datos recibidos al nuevo Smart contract
    constructor(address _account, address _accountSC){
        propietario._owner = _account;
        propietario._smartcontractPadre = _accountSC;
    }
}