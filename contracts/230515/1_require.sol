// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract REQUIRE1{
    function Require1(uint _n) public pure returns(uint) {
        require(_n<10, "input should be lower than 10");
        return _n*3;
    }

    function getName(string memory _name) public pure returns(bytes32) {
        return (keccak256(abi.encodePacked(_name)));
    }

    function onlyAlice(string memory _name) public pure returns(bool) {
        require(getName(_name) == 0x9c0257114eb9399a2985f8e75dad7600c5d89fe3824ffa99ec1c3eb8bf3b0501);
        return true;
    }
    // alice - 0x9c0257114eb9399a2985f8e75dad7600c5d89fe3824ffa99ec1c3eb8bf3b0501
}

contract REQUIRE2{
    function getBool() public pure returns(bool) {
        bool a;
        return a;
    }

    function Require1() public pure returns(uint) {
        uint a= 1;
        bool b;
        require(b, "Error");    // 통과못함
        return a;
    }

    function Require2() public pure returns(uint) {
        uint a= 1;
        bool b;
        return a;
        require(b, "Error");    // Unreachable code
    }

    uint a = 1;

    function getA() public view returns(uint) {
        return a;
    }

    function Require3() public {
        bool c;
        a = 5;
        require(c, "error");    // a를 5로 바꾼 것도 전부다 다시 revert (원래 상태로 복구시킴)
    }

    function setAasFive() public {
        a = 5;
    }

    function Require4() public {
        bool c;
        setAasFive();               // a의 값을 5로 설정하는 외부함수
        require(c, "error");        // 외부함수도 모두 revert
    }

    function Require5(uint _n) public pure returns(bool) {
        require(_n%5==0 && _n>10, "Nope");
        return true;
    }

    function Require6(uint _n) public pure returns(uint) {
        /* b,c related code */
        if(_n%3 == 0) {
            require(_n%3!=0, "nope");
        } else if(_n%3 == 1) {
            return _n%3;
        } else {
            return _n%3;
        }
    }
}

