// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract note1 {
    // 이름, 생일, 번호를 담은 구조체 Student를 선언하고 Student들이 들어갈 수 있는 array students를 선언하시오.
    struct Student {
        string name;
        uint birth;
        uint number;
    }

    Student[] students;

    // students에 Student를 넣을 수 있는 함수, n번째 학생을 반환해주는 함수, n번째 학생의 이름을 반환해주는 함수를 구현하세요.
    function pushStudent(string memory _name, uint _birth, uint _number) public {
        students.push(Student(_name, _birth, _number));
    }

    function getStudent(uint _number) public view returns(Student memory) {
        return students[_number - 1];  
    }

    function getStudentName(uint _number) public view returns(string memory) {
        return students[_number - 1].name;
    }
}

contract note2 {
    // 이름 a, 번호 b, bytes2 c를 담은 구조체 D
    struct D {
        string a;
        uint b;
        bytes2 c;
    }

    // D형 변수 ddd를 선언하시오.
    D ddd;

    // ddd에 값을 부여하는 함수를 구현하시오.
    function setDDD(string memory _a, uint _b, bytes2 _c) public {
        ddd = D(_a, _b, _c);
    }

    // D가 들어가는 array D_list를 선언하시오.
    D[] D_list;

    // D_list 전체를 반환하는 함수, D_list 안에서 n번째 데이터를 반환하는 함수를 각각 구현하시오.
    function getD(uint _number) public view returns (D memory) {
        return D_list[_number - 1];
    }

    function getD_list() public view returns (D[] memory) {
        return D_list;
    }

    function pushD_list(string memory _a, uint _b, bytes2 _c) public {
        D_list.push(D(_a, _b, _c));
    }
}

contract note3 {
    // ABC라는 구조체 안에는 숫자형 a, 문자형 b, 문자형 array c가 들어있다.
    struct ABC {
        uint a;
        string b;
        string[] c;
    }

    // ABC가 들어가는 array ABCs를 구현하고 ABCs에 ABC를 넣는 함수, 특정 ABC를 반환하는 함수 ABCs 전체를 반환하는 함수, 특정 ABC의 c array를 반환받는 함수를 각각 구현하시오.
    ABC[] ABCs;

    function pushABCs(uint _a, string memory _b, string[] memory _c) public {
        ABCs.push(ABC(_a, _b, _c));
    }

    function getABC(uint _number) public view returns (ABC memory) {
        return ABCs[_number - 1];
    }

    function getABCs() public view returns (ABC[] memory) {
        return ABCs;
    }

    function getC(uint _number) public view returns(string[] memory) {
        return ABCs[_number - 1].c;
    }
}

contract note4 {
    mapping (uint => uint) a;
    mapping (string => uint) b;
    mapping (bytes => uint) c;

    function setB(string memory _key, uint _value) public {
        b[_key] = _value;
    }

    function getB(string memory _key) public view returns(uint) {
        return b[_key];
    }

    function setB(bytes memory _key, uint _value) public {
        c[_key] = _value;
    }

    function getC(bytes memory _key) public view returns(uint) {
        return c[_key];
    }



    struct Student {
        uint number;
        string name;
        string[] classes;
    }

    mapping (string => Student) Teacher_Student;

    function setTeacher_Student(string memory _Teacher, uint _number, string memory _name, string[] memory _classes) public {
        Teacher_Student[_Teacher] = Student(_number, _name, _classes);
    }

    function getTeacher_Student(string memory _Teacher) public view returns (Student memory) {
        return Teacher_Student[_Teacher];
    }
}

contract note5 {
    struct Student {
        uint number;
        string name;
        string[] classes;
    }

    mapping (string => Student) Teacher_Student;
    mapping (string => Student[]) Teacher_Class;

    function setTeacher_Student(string memory _teacher, uint _number, string memory _name, string[] memory _classes) public {
        Teacher_Student[_teacher] = Student(_number, _name, _classes);
    }

    function getTeacher_Student(string memory _teacher) public view returns(Student memory) {
        return Teacher_Student[_teacher];
    }

    function setTeacher_Class(string memory _teacher, uint _number, string memory _name, string[] memory _classes) public {
        Teacher_Class[_teacher].push(Student(_number, _name, _classes));
    }

    function getTeacher_Class(string memory _teacher) public view returns(Student[] memory) {
        return Teacher_Class[_teacher];
    }
}