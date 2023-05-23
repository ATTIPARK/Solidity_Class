// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Quiz7 {
    /*
    숫자를 시분초로 변환하세요.
    예) 100 -> 1분 40초, 600 -> 10분, 1000 -> 16분 40초, 5250 -> 1시간 27분 30초
    */

    function Time1(uint number) public pure returns(uint, uint, uint) {
        uint hour = number / 3600;
        uint minute = (number - (hour * 3600)) / 60;
        uint second = (number- (hour * 3600) - (minute * 60));

        return (hour, minute, second);
    }

    function Time2(uint number) public pure returns(uint,string memory,uint,string memory,uint,string memory) {
        uint hour = number/3600;
        uint minute = (number%3600)/60;
        uint second = (number%3600)%60;

        return (hour,string(abi.encodePacked("hour")),minute,string(abi.encodePacked("minute")),second,string(abi.encodePacked("second")));
    }

    function atoi(uint number) internal pure returns ( string memory ) {
        if ( number == 0 ) {
            return "0" ;
        }
        uint count;
        uint _number = number ;

        while ( _number != 0 ) {
            count++;
            _number /= 10 ;
        }

        bytes memory numberToBytes = new bytes( count ) ;

        while ( number != 0 ) {
            numberToBytes[ -- count ] = bytes1( uint8 ( 48 + ( number % 10 ) ) ) ;
            number /= 10 ;
        }
        
        return string( numberToBytes ) ;
    }
}