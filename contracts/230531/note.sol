// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/utils/Strings.sol";

/*
10보다 작은 한개의 input값을 받아서 그숫자의 구구단을 반환해주는 함수를 만들어주세요
3일경우 => 3X1=3,  3X2=6 .... 3X9=27
8일경우 => 8X1=8,  8X2=16 .... 8X9=72

힌트 - openzeppelin
*/

contract note {
    function NineMultiplication(uint n) public pure returns(string[] memory) {
        require(n>0 && n<10);
        string[] memory Array = new string[](9);
        for(uint i=0; i<9; i++) {
            Array[i] = string(abi.encodePacked(Strings.toString(n), ' X ', Strings.toString(i+1), ' = ', Strings.toString(n*(i+1))));
        }

        return Array;
    }
}