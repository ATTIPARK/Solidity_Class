// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

//숫자를 시분초로 변환하세요.
// 예) 100 -> 1분 40초, 600 -> 10분, 1000 -> 16분 40초, 5250 -> 1시간 27분 30초

contract test{

    function utos( uint _input ) internal pure returns( string memory ) {

        if( _input == 0 ) return "0" ;

        // uint > bytes > string ;
        // 한 자리씩 잘라야 하고
        // 숫자의 자리수를 알아야 한다.

        uint len = 0 ;
        len = getnumlength( _input ) ;

        bytes memory temp = new bytes( len ) ;
        // 길이 수 만큼 bytes 사이즈 정하기

        while( _input != 0 ) {

            temp[ -- len ] = bytes1( uint8( 48 + ( _input % 10 ) ) ) ;
            // uint 0 >= 
            // 각 자리마다 아스키코드로 숫자 > 문자 
            // 12345 % 10 = 5 ,  1234 % 10 = 4 
            _input /= 10 ;
            
            // 48	30	0011 0000	= 0
            // 49	31	0011 0001	= 1
            // 50	31	0011 0010	= 2

        }

        return string( temp ) ;
        // 0: string: 61432

    }

    function getnumlength( uint _input ) internal pure returns( uint ) {

        uint length = 0 ;
        uint number = _input ;

        while( number > 0 ){

            length ++ ;
            number /= 10 ;

            // _input = 12345
            // length = 0 > 1   , _input = 12345 > 1234
            // length = 1 > 2 ,   _input = 1234 > 123
            // length = 2 > 3 ,   _input = 123 > 12
            // length = 3 > 4 ,   _input = 12 > 1
            // length = 4 > 5 ,   _input = 1 > 0

        }

        return length ; // 길이가 리턴됩니다.
    
    }

    function f( uint _input ) public pure returns( string memory ) {

        uint h ; // 시
        uint m ; // 분
        uint s ; // 초

        h = _input / 3600 ;
        _input %= 3600 ;

        m = _input / 60 ;
        _input %= 60 ;

        s = _input ;

        //if( h == 0 )  0시간 0분 0초
        

        string memory temp ;

        if( h != 0 ) temp = string ( abi.encodePacked( utos ( h ) , "H " ) ) ;
        if( m != 0 ) temp = string( abi.encodePacked( temp , utos( m ) , "M " ) ) ;
        if( s != 0 ) temp = string( abi.encodePacked( temp , utos( s ) , "S" ) ) ;

        return temp ;

        //  1H0M0S
        // 0: string: 1H 1M 1S

        /*
         d = a * b + c ;
         d / b = a ;
         d % b = c ;
         */

    }


}