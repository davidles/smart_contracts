// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract Food {

    //Estructura de datos
    struct dinnerPlate{
        string name;
        string ingredientes;
    }

    // Menu del dia
    dinnerPlate [] private menu;

    //Creacion de un nuevo menu
    function newMenu(string memory _name, string memory _ingredientes) internal {
        menu.push(dinnerPlate(_name, _ingredientes));
    }
}

contract Hamburguer is Food {

    address public owner;

    constructor ( ){
        owner = msg.sender;
    }

    // cocinar una hambur desde el smart contract ppal
    function doHamburguer(string memory _ingredientes, uint _uints) external {
        require (_uints <= 5, "No puedes pedir mas de 5 hamburguesas");
        newMenu("Hamburguer", _ingredientes);
    }

    // modifier: permitir el acceso unicamente al owner y solo al owner
    modifier onlyOwner(){
        require(owner == msg.sender, "No tienen permisos para ejecutar esta funcion");
        _;
    }

    // Restriccion a la ejecucion ( solo puede el owner )
    function hashPrivateNumber(uint _number) public view onlyOwner returns (bytes32){
        return keccak256(abi.encodePacked(_number));
    }

}