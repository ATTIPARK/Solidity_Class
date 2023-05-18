// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Struct {
    struct Student {
        string name;
        uint age;
    }   
    /* 구조체 선언
    struct 구조체명 {
        .../
        .../
        ...
    }
    */

    Student s;      // Student형 변수 s 선언

    function setStudent(string memory _name, uint _age) public {
        s = Student(_name, _age);
    }

    function getStudent() public view returns (Student memory){
        return s;
    }       
}

contract QUIZ {
    struct Student {
        string name;
        bool isMale;
        uint number;
        uint birth;
    }

    Student s;              // Student형 변수 s 선언
    Student[] students;     // Student형 변수들의 array students 선언

    function setStudent(string memory _name, bool _isMale, uint _number, uint _birth) public {
        // s = Student(_name, _isMale, _number, _birth);
        s.name = _name;
        s.isMale = _isMale;
        s.number = _number;
        s.birth = _birth;
    }

    function getStudent() public view returns (Student memory) {
        return s;
    }

    function pushStudent(string memory _name, bool _isMale, uint _number, uint _birth) public {
        students.push(Student(_name, _isMale, _number, _birth));        // 배열명.push(구조체명(구조체 정보들))
    }

    function popStudent() public {
        students.pop();
    }

    function getLength() public view returns(uint) {
        return students.length;
    }

    function getStudent(uint _n) public view returns(Student memory) {
        return students[_n - 1];
    }

    function getStudents() public view returns(Student[] memory) {
        return students;
    }
}

contract Errors {
    uint a;

    function add(uint _a, uint _b) public pure returns(uint) {
        return _a+_b;
    }

    /*
    function add(uint _a, uint _b) public returns(uint) {
        a = a + _a + _b;
        return a;
    }

    function add(uint _a, uint _b) public view returns(uint) {
        return a+_a+_b;
    }

    function add(uint _a, uint _c) public pure returns(uint) {
        return _a+_c;
    }

    function add(uint _a, uint _b) public pure returns(uint, uint) {
        return (_a+_a, _a+_b);
    }
    */

    function add(uint _a, uint _b, uint _c) public pure returns(uint) {
        return _a+_b+_c;
    }

    function add2() public pure returns(uint) {
        uint c = 5;
        uint d = 7;
        return c+d;
    }

}