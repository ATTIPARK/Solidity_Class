// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Mapping {
    mapping(uint => uint) a;            // key-value 쌍이 숫자-숫자로 연결되어 있는 mapping a
    mapping(uint => string) b;          // mapping(자료형 => 자료형) mapping 이름;
    mapping (string => address) c;

    // 이름을 검색하면 그 아이의 키를 반환받는 contract를 구현하고 싶다.
    mapping (string => uint) height;

    // 정보 넣기
    function setHeight(string memory _name, uint _height) public {
        height[_name] = _height;            // mapping이름[key 값] = value 값
    }

    // 정보 받기
    function getHeight(string memory _name) public view returns(uint) {
        return height[_name];               // mapping이름[key 값];
    }

    function deleteHeight(string memory _name) public {
        delete height[_name];
    }
}