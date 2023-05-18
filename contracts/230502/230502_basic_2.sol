// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

/*
계산기를 만드세요
2개의 input 값을 받아 더한 값을 반환하는 함수 Add, 곱한 값을 반환하는 함수 Mul, 뺀 값을 반환하는 Sub 그리고 몫과 나머지를 반환하는 함수 Div를 구현하세요
*/

contract Calculator{
    
    function Add(uint num1, uint num2) public pure returns(uint){
        return num1 + num2;
    }

    function Mul(uint num1, uint num2) public pure returns(uint){
        return num1 * num2;
    }

    function Sub(uint num1, uint num2) public pure returns(uint){
        return num1 - num2;
    }
    
    function Div(uint num1, uint num2) public pure returns(uint, uint){
        return (num1 / num2, num1 % num2);
    }
}