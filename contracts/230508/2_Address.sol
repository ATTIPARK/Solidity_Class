// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Address {
    address a;

    // contract의 address
    function getAddress() public view returns(address) {
        return address(this);
    }

    // msg.sender의 address 
    function getMyAddress() public view returns(address) {
        return address(msg.sender);
    }

    function getMyBalance() public view returns(uint) {
        return address(msg.sender).balance; //[나중에] 3 차이
    }

    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }

    function setA(address _a) public {
        a = _a;
    }

    function setA2(bytes20 _a) public {
        a = address(_a);
    }

    function getA() public view returns(address) {
        return a;
    }

    function getA2() public view returns(bytes20){
        return bytes20(a);
    }

    /*
    // x
    function setA(bytes20 _a) public {
        a = _a;
    }

    // x
    function getA() public view returns(bytes20) {
        return a;
    }
    */
}