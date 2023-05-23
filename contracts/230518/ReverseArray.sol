// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ReverseArray {
    function reverse(uint[] calldata numbers) public pure returns(uint[] memory) {  // input 값인 numbers라는 배열은 값이 변화하지 않기 때문에 calldata를 사용
        uint[] memory _reverse = new uint[](numbers.length);    // 배열 값의 순서를 바꿔서 저장할 새로운 배열 선언

        for(uint i = 0; i < numbers.length; i++) {
            _reverse[i] = numbers[numbers.length - i - 1];      // 새로운 배열에 numbers의 배열의 뒷자리부터 넣어주는 forans
        }

        return _reverse;            // 새로운 배열 _reverse 반환
    }

    function reverse2(uint[] memory numbers) public pure returns(uint[] memory) {   // input 값인 numbers라는 배열은 값이 변화하고 반환하기 때문에 memory를 사용
        for(uint i = 0; i < numbers.length/2; i++) {        // 길이가 홀수일수도 있고 짝수일수도 있어서 길이를 2를 나눈값이 i보다 커야한다는 조건문을 사용
            (numbers[i], numbers[numbers.length-1-i]) = (numbers[numbers.length-1-i], numbers[i]);      // 자리를 서로 바꿔주는 코드
        }
        return numbers;     // numbers 라는 배열을 다시 반환
    }
}