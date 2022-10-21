// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract maths{
    function suma(uint a, uint b) public pure returns (uint){
        return a+b;
    }

    function resta(uint a, uint b) public pure returns (uint){
        return a-b;
    }

    function div(uint a, uint b) public pure returns (uint){
        return a/b;
    }
}