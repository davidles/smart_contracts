// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract etherSend {
    /* Capacidad para enviar pagos ethers*/
    constructor() payable {}

    /* funcion que se encarga de recibir pagos ethers*/
    receive() external payable {}

    // Eventos
    event sendStatus(bool);
    event callStatus(bool, bytes);

    /* 3 Formas de hacer envios: Principal diferencia -> Estipendio de gas (cantidad de gas enviada)

        - Transfer y Send envian 2300 unidades de GAS
        - Call envia todo el GAS asi no este restringido y tenga un rango mas amplio de ejecucion
    
     */

    // Transfer
    function sendViaTransfer( address payable _to) public payable {
        _to.transfer( 1 ether );
    }

    // Send -> retorna un booleano
    function sendViaSend( address payable _to ) public payable {
        /* bool: indica si fue o no enviado correctamente */
        bool sent = _to.send( 1 ether );
        emit sendStatus( sent );

    /* Para cortar la ejecucion en caso de que sent no sea true */
        require( sent == true, "El envio ha fallado");
    }
    // Call
    function sendViaCall( address payable _to ) public payable {
        /* Recibe dos argumentos */
        (bool success, bytes memory data) = _to.call{ value: 1 ether }("");
        emit callStatus(success, data);

        require(success == true , "El envio ha fallado");
    }

}


contract ethReceiver {

    event log( uint amount, uint gas );

    receive() external payable {
        /* Va a gastar una cierta cantidad de GAS */
        /* gasleft(): funcion interna que informa la cantidad de gas restante*/

        emit log( address(this).balance, gasleft());

    }
}