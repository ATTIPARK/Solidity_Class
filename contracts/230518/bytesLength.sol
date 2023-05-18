// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract BYTES_LENGTH {
    function bytes1ToString(bytes1 a) public pure returns(string memory) {
        string memory _a = string(abi.encodePacked(a));
        return _a;
    }
}

contract String_Bytes {
    // 문자열을 넣었을 때 그 문자열의 자릿수와 문자열을 한 글자씩 분리한 결과를 반환하세요.
    // 예) abde -> 4,   a,b,d,e // fkeadf -> 6,   f,k,e,a,d,f

    function DivideString(string memory _str) public pure returns(uint, string[] memory) {
        bytes memory stringToBytes = bytes(_str);
        string[] memory bytesToString = new string[](stringToBytes.length);

        for(uint i = 0; i < stringToBytes.length; i++) {
            bytesToString[i] = string(abi.encodePacked(stringToBytes[i]));
        }

        return(bytesToString.length, bytesToString);
    }
}