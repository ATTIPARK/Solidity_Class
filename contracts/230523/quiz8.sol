// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/*
로또 프로그램을 만드려고 합니다. 숫자와 문자는 각각 4개 2개를 뽑습니다. 6개가 맞으면 1이더, 5개의 숫자가 순서와 함께 맞으면 0.75이더, 
4개가 맞으면 0.25이더, 3개가 맞으면 0.1이더 2개 이하는 상금이 없습니다. 

참가 금액은 0.05이더이다.

기준 숫자 : 1,2,3,4,A,B
-----------------------------------------------------------------
기준 숫자 설정 기능 : 5개의 사람이 임의적으로 4개의 숫자와 2개의 문자를 넣음. 5명이 넣은 숫자들의 중앙값과 알파벳 순으로 따졌을 때 가장 가운데 문자로 설정
예) 숫자들의 중앙값 : 1,3,6,8,9 -> 6 // 2,3,4,8,9 -> 4
예) 문자들의 중앙값 : a,b,e,h,l -> e // a,h,i,q,z -> i 
*/

contract Q8p {

    // mapping (address => mapping(uint => bytes2)) Lotto;      // 주소 => 몇번 => 뽑은 숫자와 문자

    bytes4[] winningNumNLetter;

    // 기준 숫자 : 1,2,3,4,A,B
    // function getPrize() public {
    //     uint count;

    //     if (Lotto[msg.sender][1] == abi.encodePacked("1")) {
    //         count++;
    //     }
    // }

    // function getRandomNumber() private view returns (bytes4) {
    //     bytes4 randomBytes = bytes4(uint(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, block.number))));
    //     return randomBytes;
    // }

    uint randNonce = 0;
 
    // Defining a function to generate
    // a random number
    function randMod(uint _modulus) external returns(uint)
    {
        // increase nonce
        randNonce++;
        return uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,randNonce))) % _modulus;
    }
}

contract Q8 {
    struct player{
        uint a;
        uint b;
        uint c;
        uint d;
        string e;
        string f;
    }

    mapping (address => player) Lotto;

    uint[4] winningNum;
    string[2] winningLetter;
    uint public reward;

    function setWinningNumNLetter() public {
        for(uint i = 0; i < winningNum.length; i++) {
            winningNum[i] = i+1;
        }
        winningLetter[0] = "A";
        winningLetter[1] = "B";
    }

    function setUserLotto(uint _a, uint _b, uint _c, uint _d, string memory _e, string memory _f) public {
        Lotto[msg.sender] = player(_a, _b, _c, _d, _e, _f);
    }

    function getPrize(address _addr) public payable {
        require(_addr == msg.sender);
        // require( msg.value == 0.05 ether);

        uint CorretCount;

        if(winningNum[0] == Lotto[_addr].a) {CorretCount++;}
        if(winningNum[1] == Lotto[_addr].b) {CorretCount++;}
        if(winningNum[2] == Lotto[_addr].c) {CorretCount++;}
        if(winningNum[3] == Lotto[_addr].d) {CorretCount++;}
        if(keccak256(abi.encodePacked(winningLetter[0])) == keccak256(abi.encodePacked(Lotto[_addr].e))) {CorretCount++;}
        if(keccak256(abi.encodePacked(winningLetter[1])) == keccak256(abi.encodePacked(Lotto[_addr].f))) {CorretCount++;}

        reward = 0;

        if(CorretCount == 6) {reward = 1 ether;}
        else if(CorretCount == 5) {reward = 0.75 ether;}
        else if(CorretCount == 4) {reward = 0.25 ether;}
        else if(CorretCount == 3) {reward = 0.1 ether;}

    }
}