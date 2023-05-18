// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/*
숫자를 넣었을 때 그 숫자의 자릿수와 각 자릿수의 숫자를 나열한 결과를 반환하세요.
예) 2 -> 1,   2 // 45 -> 2,   4,5 // 539 -> 3,   5,3,9 // 28712 -> 5,   2,8,7,1,2
--------------------------------------------------------------------------------------------
문자열을 넣었을 때 그 문자열의 자릿수와 문자열을 한 글자씩 분리한 결과를 반환하세요.
예) abde -> 4,   a,b,d,e // fkeadf -> 6,   f,k,e,a,d,f
*/

contract codingTest {
    function seperateNumber(uint _n) public pure returns(uint, uint[] memory){
        uint number = _n;
        uint count;

        if(number == 0) {
            uint[] memory zero = new uint[](1);
            zero[0] = number;
            return(zero.length, zero);
        }

        // 자릿수 구하기
        for(; number != 0;) {
            number /= 10;
            count++;
        }

        number = _n;
        uint[] memory numArray = new uint[](count);

        for(uint i = 0; i < count; i++) {
            numArray[(count-1) - i] = number % 10;
            number /= 10;
        }
        return(count, numArray);
    }

    function seperateString(string memory _string) public pure returns (uint, string[] memory) {
        bytes memory stringToBytes = bytes(_string);
        uint length = stringToBytes.length;

        string[] memory seperateStr = new string[](length);

        for(uint i = 0; i < length; i++) {
            seperateStr[i] = string(abi.encodePacked(stringToBytes[i]));
        }
        return (length, seperateStr);
    }
}