// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Quiz{

    string Str1;
    string Str2;

    // 제곱
    function Square(uint a) public pure returns(uint){
        return a**2; // a*a
    }

    // 세제곱
    function Cubic(uint a) public pure returns(uint){
        return a**3; // a*a*a
    }

    // a의 b승
    function AnB(uint a, uint b) public pure returns(uint){
        return a**b;
    }

    function setStr1(string memory a) public{
        Str1 = a;
    }

    function setStr2(string memory b) public{
        Str2 = b;
    }

    function getStr1() public view returns(string memory){
        return Str1;
    }

    function getStr2() public view returns(string memory){
        return Str2;
    }

    function setStr1asFive() public{
        Str1 = "5";
    }
}