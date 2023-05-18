// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract BOOL {
    bool isFun;

    function getVar() public view returns (bool) {
        return isFun;
    }

    function Fun() public {
        isFun = true;
    }

    function notFun() public {
        isFun = false;
    }

    function FunORnotFun() public {
        isFun = !isFun;
    }

    function Fun(bool _a) public {
        isFun = _a;
    }
}