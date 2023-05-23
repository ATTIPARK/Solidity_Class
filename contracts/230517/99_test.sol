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

    /*
    문제-숫자를 넣었을 때 그 숫자의 자릿수와 각 자릿수의 숫자를 나열한 결과를 반환하세요.
    예) 2 -> 1,   2 // 45 -> 2,   4,5 // 539 -> 3,   5,3,9 // 28712 -> 5,   2,8,7,1,2
    */
    function seperateNumber(uint _n) public pure returns(uint, uint[] memory){
        uint number = _n;
        uint count;

        if(number == 0) {                           // input 값이 0일 경우의 값
            uint[] memory zero = new uint[](1);
            zero[0] = number;
            return(zero.length, zero);
        }

        // 자릿수 구하기
        while(number != 0) {                       // number가 0이 아닐경우
            number /= 10;                           // 10으로 나눔으로써(소수점을 지원하지 않는다는 이점을 사용)
            count++;                                // count 증가
        }

        number = _n;                                // 10으로 나눈 상태라서 다시 number에 input값을 새로 부여
        uint[] memory numArray = new uint[](count); // 자릿수를 구함으로써 숫자를 각자 쪼개어서 저장할 배열을 새로 생성

        for(uint i = 0; i < count; i++) {           // for 문을 통해서 배열에 값 부여
            numArray[(count-1) - i] = number % 10;  // 나머지 연산으로 통해 뒷자리부터 나온다는것을 알고 배열 마지막번방 부터 값을 부여
            number /= 10;                           // 나머지값을 넣고 나서 다음 숫자를 알기위해 10으로 나누기를 진행
        }
        return(count, numArray);                    // 문제대로 count 와 배열을 반환
    }

    /*
    문자열을 넣었을 때 그 문자열의 자릿수와 문자열을 한 글자씩 분리한 결과를 반환하세요.
    예) abde -> 4,   a,b,d,e // fkeadf -> 6,   f,k,e,a,d,f
    */
    function seperateString(string memory _string) public pure returns (uint, string[] memory) {
        bytes memory stringToBytes = bytes(_string);// 문자열 값을 bytes로 변환해서 새로운 bytes형태로 선언
        uint length = stringToBytes.length;// bytes는 배열값으로 저장이된다는 부분을 이용해서 길이를 반환, 문자열 자릿수

        string[] memory seperateStr = new string[](length);// bytes형태를 string으로 다시 바꿔서 저장할 문자열 배열을 새로 선언

        for(uint i = 0; i < length; i++) {
            seperateStr[i] = string(abi.encodePacked(stringToBytes[i]));// for문을 통해서 각 자리마다 값부여, 부여할떄는 abi.endcodePacked를 통해서 bytes에서 string으로 변환
        }
        return (length, seperateStr);// 문제대로 자릿수인 length와 문자열 배열 반환
    }
}