// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import './b.sol';   // import './위치/파일명';
import './d/dd.sol';

contract A {
    B_SmartContract b_con = new B_SmartContract();
    D_Contract d_con = new D_Contract();

    function add(uint _a, uint _b) public view returns (uint) {
        return b_con.add(_a, _b);
    }

    function multi(uint _a, uint _b) public view returns(uint) {
        return d_con.multiplay(_a, _b);
    }
}