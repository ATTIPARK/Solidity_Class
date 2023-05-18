// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract quiz4 {
    mapping(uint => string) Menu;

    function setMenu(uint _number, string memory _food) public {
        Menu[_number] = _food;
    }

    function getRandomMenu() public view returns(string memory) {
    }
}

contract quiz3 {
    function getAverage(uint a, uint b) public pure returns (uint) {
        uint sum;
        uint average;

        for(uint n = a; n <= b; n ++) {
            sum += n;
        }
        average = sum / (b - a + 1);

        return average;
    }

}

contract quiz2 {
    struct Student {
        string name;
        uint math;
        uint english;
        uint korean;
        uint average;
    }

    mapping(string => Student[]) classes;

    function setTeacherStudent(string memory _teacher, string memory _student, uint _math, uint _english, uint _korean) public {
        uint sum = 0;
        sum = _math + _english + _korean;
        uint _average = sum /= 3;
        classes[_teacher].push(Student(_student, _math, _english, _korean, _average));
    }

    function getAllStudent(string memory _teacher) public view returns (Student[] memory) {
        return classes[_teacher];
    }
}

contract quiz1 {
    uint[] number;
    uint average;

    function setNumber(uint _number) public {
        if(_number > 100) {
            return;
        } else {
            for(uint n = 0; n < _number; n ++) {
                number.push(n + 1);
            }
        } 
    }

    function setAverage() public {
        uint sum = 0;
        for(uint n = 0; n < number.length; n++) {
            sum += number[n];
        }
        average = sum / number.length;
    }

    function getAverage() public view returns (uint) {
        return average;
    }

    function getNumber() public view returns (uint[] memory) {
        return number;
    }
}