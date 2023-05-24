// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract D_Contract {
    function multiplay(uint _a, uint _b) public pure returns(uint) {
        return _a*_a*_b;
    }
}