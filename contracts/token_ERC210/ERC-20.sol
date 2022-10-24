// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

//import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
/*
contract MyCollectible is ERC721 {
    constructor() ERC721("MyCollectible", "MCO") {
    }
}
*/

interface IERC20{
    // Total de tokens existentes
    function totalSupply() external view returns (uint256);

    // Balance de cada cuenta
    function balanceOf(address account) external view returns (uint256);

    // Transferencia de tokens ( receptor)
    function transfer(address to, uint256 amount) external returns (bool);

    // Allowance (prestamo)
    function allowence(address owner, address spend) external view returns (uint256);

    // Asignacion propia a un usuario
    function approve(address spender, uint256 amount) external returns (bool);

    // Desde donde se hacen las transferencia de tockens (emisor)
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);

    // Eventos que me permiten emitir (info) a la blockchain

    /**
    * Parametro indexado: se utilizan para eventos registrados que le permitiran buscar estos 
    * eventos utilizando los parametros indexados como filtros
    */
    event Transfer(address indexed from, address indexed to, uint value);

    // Asignacion de un spender a un owner
    event Approve(address indexed owner, address indexed spender, uint value);
}