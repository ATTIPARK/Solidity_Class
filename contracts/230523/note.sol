// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract babyLion {
/*
월 과 일을 input 값으로 받아서 이 날짜가 1년중 몇번쨰 날인지를 반환해주는 함수를 만드시오
uint[12] daysPerMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
*/

    uint[12] daysPerMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    function getDays(uint month, uint day) public view returns(uint) {
        require(month >= 1 && month <= 12);
        require(day >= 1 && day <= daysPerMonth[month-1]);

        uint currentDay = day;

        for(uint i = 0; i < month-1; i++) {
            currentDay += daysPerMonth[i];
        }

        return currentDay;
    }
}