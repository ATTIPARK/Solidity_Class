// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract WHILE {
    function while_1(uint _n)public pure returns(uint) {
        uint _a;
        while(_n > _a) {
            _a++;
        }
        return _a;
    }

    uint[] public a;
    function while_2(uint _n) public returns(uint[] memory) {
        while(a.length < _n) {
            a.push(a.length + 1);
        }
        return a;
    }
}



