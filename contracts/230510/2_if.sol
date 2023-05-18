// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract IF1 {
    function setScore(uint _score) public pure returns (string memory) {
        if(_score >= 50){
            return "PASS";
        } else {
            return "FAIL";
        }
    } 

    function setClass(uint _score) public pure returns (string memory) {
        if(_score >= 70) {
            return "Class A";
        } else if(_score >= 50) {
            return "Class B";
        } else{
            return "Class C";
        }
    }

    uint[] even;
    uint[] odd;
    function evenORodd(uint _number) public {
        if(_number % 2 == 0) {
            even.push(_number);
        } else {
            odd.push(_number);
        }
    }

    function getEven() public view returns(uint[] memory) {
        return even;
    }

    function getOdd() public view returns(uint[] memory) {
        return odd;
    }

    uint[] A;
    uint[] B;
    uint[] C;
    function getABC(uint _number) public {
        if(_number % 3 == 1) {
            A.push(_number);
        } else if(_number % 3 == 2) {
            B.push(_number);
        } else{
            C.push(_number);
        }
    }
}

contract IF2 {
    struct student {
        uint number;
        string name;
        uint score;
        string credit;
    }

    student a;
    student b;
    student c;

    student[] Students;

    // 학생 정보 중 번호, 이름, 점수만 입력하면 학점은 자동 계산해 주는 함수
    function setAlice(uint _number, string memory _name, uint _score) public {
        string memory _credit;
        if(_score >= 90) {
            _credit = "A";
        } else if(_score >= 80) {
            _credit = "B";
        } else if(_score >= 70) {
            _credit = "C";
        } else {
            _credit = "F";
        }

        a = student(_number, _name, _score, _credit);
    }

    function setBob(uint _number, string memory _name, uint _score) public {
        string memory _credit;
        if(_score >= 90) {
            _credit = "A";
        } else if(_score >= 80) {
            _credit = "B";
        } else if(_score >= 70) {
            _credit = "C";
        } else {
            _credit = "F";
        }

        b = student(_number, _name, _score, _credit);
    }

    function setCharlie(uint _number, string memory _name, uint _score) public {
        string memory _credit;
        if(_score >= 90) {
            _credit = "A";
        } else if(_score >= 80) {
            _credit = "B";
        } else if(_score >= 70) {
            _credit = "C";
        } else {
            _credit = "F";
        }

        c = student(_number, _name, _score, _credit);
    }

    function getStudentsABC() public view returns(student memory, student memory, student memory) {
        return (a, b, c);
    }

    function pushStudent(uint _number, string memory _name, uint _score) public {
        string memory _credit;
        if(_score >= 90) {
            _credit = "A";
        } else if(_score >= 80) {
            _credit = "B";
        } else if(_score >= 70) {
            _credit = "C";
        } else {
            _credit = "F";
        }

        Students.push(student(_number, _name, _score, _credit));
    }

    function pushStudent2(uint _number, string memory _name, uint _score) public {
        Students.push(student(_number, _name, _score, setGrade(_score)));
    }

    function getStudents() public view returns(student[] memory) {
        return Students;
    }

    function setGrade(uint _score) public pure returns (string memory) {
        if(_score >= 90) {
            return "A";
        } else if(_score >= 80) {
            return "B";
        } else if(_score >= 70) {
            return "C";
        } else {
            return "F";
        }
    }
}

contract IF3 {

   function setNumber(uint _n) public pure returns(string memory) {
      if(_n>=70 || _n<=10) { // or -> || 
         return "A";
      } else if(_n>=50 && _n%3==0) {
         return "B";
      } else {
         return "C";
      }
   }
}

contract IF4{
    uint[] score;
    uint average;

    function pushScoreNsetAverage(uint _score) public {
        score.push(_score);

        uint totalScore = 0;
        for(uint n = 0; n < score.length; n++) {
            totalScore += score[n];
        }
        average = totalScore / score.length;
    }

    function getAverage() public view returns(uint) {
        return average;
    }

    function getGrade() public view returns(string memory) {
        if(average >= 90) {
            return "A";
        } else if(average >= 80) {
            return "B";
        } else if(average >= 70) {
            return "C";
        } else {
            return "F";
        }
    }
}