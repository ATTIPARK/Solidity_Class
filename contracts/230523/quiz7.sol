// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Q7 {
    /*
    숫자를 시분초로 변환하세요.
    예) 100 -> 1분 40초, 600 -> 10분, 1000 -> 16분 40초, 5250 -> 1시간 27분 30초
    */

    function setTime(uint _n) public pure returns(string memory) {
        uint hour = _n/3600;
        uint minute = (_n%3600)/60;  // min = (_n/60)%60;
        uint second = _n%60;

        if(hour > 0) {
            return string(abi.encodePacked(concat(hour), "h ", concat(minute), "m ", concat(second), "s"));
        } else if(minute > 0) {
            return string(abi.encodePacked(concat(minute), "m ", concat(second), "s"));
        } else{
            return string(abi.encodePacked(concat(second), "s"));
        }
    }

    function concat(uint n) internal pure returns(string memory) {
        uint count;
        uint copyA = n;
        while(copyA != 0) {
            copyA /= 10;
            count++;
        }

        uint[] memory NumToArray = new uint[](count);
        copyA = n;
        uint copyCount = count;
        while(copyA != 0) {
            NumToArray[--copyCount] =  copyA%10;
            copyA /= 10;
        }
        
        for(uint i = 0; i < count; i++) {
            NumToArray[i] += 48;
        }

        return string(abi.encodePacked(NumToArray));
    }
}