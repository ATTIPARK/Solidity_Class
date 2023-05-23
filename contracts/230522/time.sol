// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract TIME {
    uint public currentTime = block.timestamp;

    function currentTime2() public view returns(uint) {
        return block.timestamp;
    }

    function currentBlockNumber() public view returns(uint) {
        
    }
}