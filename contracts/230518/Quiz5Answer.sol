// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Quiz5_Number {
    function divideNumber(uint _n) public pure returns(uint, uint[] memory) {
        uint a = getLength(_n);
        uint[] memory b = new uint[](a);

        uint i = a;
        while(_n != 0) {
            b[--i] = _n%10;
            _n /= 10;
        }

        return (b.length, b);
    }

    function getLength(uint _n) public pure returns(uint) {
        uint a;
        while(_n > 10**a) {
            a++;
        }
        return a;
    }
}

contract Quiz5_String {
    
}