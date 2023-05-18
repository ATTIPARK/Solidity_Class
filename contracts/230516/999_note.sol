// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract DAD {
    function dad() virtual public pure returns(string memory) {
        return "dad from DAD";
    }
}

contract MOM {
    function mom() public pure returns(string memory) {
        return "mom from MOM";
    }
}

contract CHILD is DAD {
    function child() public pure returns(string memory) {
        return "child from CHILD";
    }

    function dad() override public pure returns(string memory) {
        return "dad from CHILD";
    }
}