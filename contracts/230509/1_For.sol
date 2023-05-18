// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract For {
    function forLoop() public pure returns(uint){
        uint a;

        for(uint i=1; i<6; i++ /*시작점; 끝점; 변화방식*/) {
            a = a+i; // a+=i
        }

        return a;
    }

    function forLoop2() public pure returns(uint, uint){
        uint a;
        uint i;

        for(i=1; i<6; i++ /*시작점; 끝점; 변화방식*/) {
            a = a+i;
        }

        return (a,i);
    }

    function forLoop3() public pure returns(uint, uint) {
        uint a;
        uint i;

        for(i=1;i<=5; i++) {
            a=a+i;
        }

        return (a,i);
    }

    //====================================================

    uint[4] array;
    uint count;

    function pushArray(uint _n) public {
        array[count++] = _n;
    }

    function getArray() public view returns (uint[4] memory) {
        return array;
    } 

    function forLoop4() public view returns (uint) {
        uint a;
        for(uint i = 0; i < 4; i++) {
            a = a + array[i];
        }
        return a;
    }
    function forLoop5() public view returns (uint) {
        uint a;
        for(uint i = 0; i < array.length; i++) {
            a = a + array[i];
        }
        return a;
    }

    //====================================================

    uint[] d;
    
    function pushd(uint _n) public {
        d.push(_n);
    }

    function getD() public view returns(uint[] memory) {
        return d;
    }

    function forLoop6() public view returns(uint) {
        uint a;
        for(uint i=0;i<d.length;i++) {
            a=a+d[i];
        }
        return a;
    }

}

contract fixedArray {
    uint[] a;
    uint[4] b;

    function getALength() public view returns (uint) {
        return a.length;
    }

    function pushA(uint _n) public {
        a.push(_n);
    }

    function getA() public view returns(uint[] memory) {
        return a;
    }

    function getBLength() public view returns (uint) {
        return b.length;
    }

    function pushB(uint n, uint _n) public {
        b[n - 1] = _n;
    }

    uint count;

    function pushB2(uint _n) public {
        b[count++] = _n;
    }

    function getB() public view returns (uint[4] memory) {
        return b;
    }

    function getCount() public view returns (uint) {
        return count;
    }
}