// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract DAD {
    uint a;

    uint public wallet=100; // 공개한 지갑 잔액
    uint internal crypto=1000; // 메모장에 private key가 있는 크립토 잔액
    uint private emergency=10000; // 진짜 비상금

    function password() private pure returns(uint) {
        return 1234;
    }

    function changeWallet(uint _n) internal {
        wallet = _n;
    }

    // function getMsgSender() virtual public view returns(address) {
    //     return msg.sender;
    // }
}

contract MOM {
    DAD husband = new DAD();
    DAD realHusband;

    constructor(address _a) {
        realHusband = DAD(_a);
    }

    function getWallet() public view returns(uint) {
        return husband.wallet();
    }

    function getRealWallet() public view returns(uint) {
        return realHusband.wallet();
    }

    // function changeRealWallet(uint _a) public {
    //     realHusband.changeWallet(_a);
    // }

    // function setDad(address _a) public view returns(uint) {
    //     DAD copyDad = DAD(_a);
    //     return copyDad.wallet();
    // }

    // function getHusbandMsgSender() public view returns(address) {
    //     return husband.getMsgSender();
    // }
}

contract Child is DAD {
    function dadChangeWallet(uint _a) public {
        super.changeWallet(_a);
    }

    // DAD daddy = new DAD();
    // DAD daddy2 = new DAD();

    // function getDadMsgSender() public view returns(address) {
    //     return super.getMsgSender();
    // }

    // function getDaddyMsgSender() public view returns(address) {
    //     return daddy.getMsgSender();
    // }
    
    // function getDaddy2MsgSender() public view returns(address) {
    //     return daddy2.getMsgSender();
    // }

}