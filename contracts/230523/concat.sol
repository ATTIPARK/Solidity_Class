// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract CONCAT {
    function concat1(string memory a, string memory b) public pure returns(string memory) {
        return string(abi.encodePacked(a,b));
    }

    function concat2(string memory a, string memory b) public pure returns(string memory) {
        return string.concat(a,":", a, a, " ", b, ":", b, b); // a:aab:bb
    }

    function concat3(uint a, string memory b, string memory c) public pure returns(string memory) {
        return string(abi.encodePacked(a,b,c));
    }

    function returnEncodePacked(uint a, string memory b) public pure returns(bytes memory, bytes memory) {
        return (abi.encodePacked(a), abi.encodePacked(b));
    }

    function concat4(uint a, uint b, uint c) public pure returns(string memory) {
        a = a+48;
        b = b+48;
        c = c+48;
        return string(abi.encodePacked(a,b,c));
    }

    Q5 q5 = new Q5();

    function concat5(uint a) public view returns(string memory) {
        uint b = q5.getLength(a);
        uint[] memory c = new uint[](b);
        c = q5.divideNumber(a);
        for(uint i = 0; i < c.length; i++) {
            c[i] += 48;
        }

        return string(abi.encodePacked(c));
    }

    function concat6(uint n) public pure returns(string memory) {
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

contract Q5 {
    function divideNumber(uint _n) public pure returns(uint[] memory) {
        uint[] memory b = new uint[](getLength(_n));

        uint i=getLength(_n);
        while(_n !=0) {
            b[--i] = _n%10;
            _n = _n/10;
        }
        return (b);
    }

    function getLength(uint _n) public pure returns(uint) {
        uint a;
        while(_n >= 10**a) {
            a++;
        }
        return a;
    }
}