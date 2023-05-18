// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Practice{
    uint[] a;

    function pushA(uint _a) public {
        a.push(_a);
    }

    function popA() public {
        a.pop();
    }

    function getA(uint _n) public view returns(uint) {
        return a[_n - 1];
    }

    function deleteA(uint _n) public {
        delete a[_n - 1];
    }

    function getArray() public view returns(uint[] memory) {
        return a;
    }
}