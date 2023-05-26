// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract A {
    function add(uint _a, uint _b, uint _c, uint _d) public pure returns(uint) {
        return _a+_b+_c+_d;
    }

    uint public a;
    function setA(uint _a) public {
        a = _a;
    }
}

