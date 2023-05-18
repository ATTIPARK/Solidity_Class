// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract note {
    struct Student {
        string name;
        uint number;
        string[] classes;
    }

    Student[] students;
    mapping (string => Student[]) Teacher_Student;

    function setTeacher_Student(string memory _teacher, string memory _name, uint _number, string[] memory _classes) public {
        Teacher_Student[_teacher].push(Student(_name, _number, _classes));
    }

    function set2(string memory _teacher, uint _n, uint _number) public {
        Teacher_Student[_teacher][_n - 1].number = _number;
    }

    function getTeacher_Student(string memory _teacher) public view returns(Student[] memory) {
        return Teacher_Student[_teacher];
    }

    function setStudents(string memory _name, uint _number, string[] memory _classes) public {
        students.push(Student(_name, _number, _classes));
    }

    function getStudents(uint _n) public view returns (Student memory) {
        return students[_n - 1];
    }

    function getName(uint _n) public view returns (string memory) {
        return students[_n - 1].name;
    }
}