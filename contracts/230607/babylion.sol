// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/utils/Strings.sol";

contract Q1 {
    /*
    단어를 입력하고 미리 정해진 단어과 비교해서 같으면 해당 번호를 출력하는 함수를 만드세요.
    단어 2개를 비교하는 equal 함수를 만들어서 활용하세요.
    hello와 같으면 1, hi와 같으면 2, move와 같으면 3, 다 해당되지 않으면 4를 출력합니다.
    Goerli testnet에 배포 및 verify 후 컨트랙트 주소를 제출하세요.
    */

    function compareStrings(string memory _a) public pure returns(uint) {
        if(keccak256(abi.encodePacked(_a)) == keccak256(abi.encodePacked("hello"))) {
            return 1;
        } else if(keccak256(abi.encodePacked(_a)) == keccak256(abi.encodePacked("hi"))) {
            return 2;
        } else if(keccak256(abi.encodePacked(_a)) == keccak256(abi.encodePacked("move"))) {
            return 3;
        } else {
            return 4;
        }
    }
}

contract Q2 {
    /*
    10보다 작은 한개의 input값을 받아서 그숫자의 구구단을 반환해주는 함수를 만들어주세요
    3일경우 => 3X1=3,  3X2=6 .... 3X9=27
    8일경우 => 8X1=8,  8X2=16 .... 8X9=72

    힌트 - openzeppelin
    */

    function uintToString(uint _n) internal pure returns(string memory) {
        if(_n == 0) {
            return "0";
        }

        uint count;
        uint n = _n;

        while(n != 0) {
            count++;
            n /= 10;
        }

        bytes memory uintToBytes = new bytes(count);

        while (_n != 0) {
            count--;
            uintToBytes[count] = bytes1(uint8(48 + (_n % 10)));
            _n /= 10;
        }

        return string(uintToBytes);
    }

    function getMultiplication(uint _n) public pure returns(string[] memory) {
        require(_n>0 && _n<10);
        string[] memory array = new string[](9);
        
        for(uint i = 0; i < array.length; i++) {
            array[i] = string(abi.encodePacked(uintToString(_n), ' X ', uintToString(i+1), ' = ', uintToString(_n*(i+1))));
        }

        return array;
    }
}