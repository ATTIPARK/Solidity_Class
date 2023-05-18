// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract codingtest{

    /*
    여러분은 선생님입니다. 학생들의 정보를 관리하려고 합니다. 
    학생의 정보는 이름, 번호, 점수, 학점 그리고 듣는 수업들이 포함되어야 합니다.

    번호는 1번부터 시작하여 정보를 기입하는 순으로 순차적으로 증가합니다.

    학점은 점수에 따라 자동으로 계산되어 기입하게 합니다. 90점 이상 A, 80점 이상 B, 70점 이상 C, 60점 이상 D, 나머지는 F 입니다.
    필요한 기능들은 아래와 같습니다.

    * 학생 추가 기능 - 특정 학생의 정보를 추가
    * 학생 조회 기능(1) - 특정 학생의 번호를 입력하면 그 학생 전체 정보를 반환
    * 학생 조회 기능(2) - 특정 학생의 이름을 입력하면 그 학생 전체 정보를 반환
    * 학생 점수 조회 기능 - 특정 학생의 이름을 입력하면 그 학생의 점수를 반환
    * 학생 전체 숫자 조회 기능 - 현재 등록된 학생들의 숫자를 반환
    * 학생 전체 정보 조회 기능 - 현재 등록된 모든 학생들의 정보를 반환
    * 학생들의 전체 평균 점수 계산 기능 - 학생들의 전체 평균 점수를 반환
    * 선생 지도 자격 자가 평가 시스템 - 학생들의 평균 점수가 70점 이상이면 true, 아니면 false를 반환
    * 보충반 조회 기능 - F 학점을 받은 학생들의 숫자와 그 전체 정보를 반환
    -------------------------------------------------------------------------------
    * S반 조회 기능 - 가장 점수가 높은 학생 4명을 S반으로 설정하는데, 이 학생들의 전체 정보를 반환하는 기능 (S반은 4명으로 한정)

    기입할 학생들의 정보는 아래와 같습니다.

    Alice, 1, 85
    Bob,2, 75
    Charlie,3,60
    Dwayne, 4, 90
    Ellen,5,65
    Fitz,6,50
    Garret,7,80
    Hubert,8,90
    Isabel,9,100
    Jane,10,70
    */

    struct Student {
        string name;
        uint number;
        uint score;
        string grade;
        string[] classes;
    }

    mapping (string => Student) NameToClass;
    Student[] Class;
    

    function setStudent(string memory _name, uint _number, uint _score, string[] memory _class) public {
        string memory _grade;
        if(_score >= 90) {
            _grade = "A";
        } else if (_score >= 80) {
            _grade = "B";
        } else if (_score >= 70) {
            _grade = "C";
        } else if (_score >= 60) {
            _grade = "D";
        } else {
            _grade = "F";
        }
        NameToClass[_name] = Student(_name, _number, _score, _grade, _class);
        Class.push(Student(_name, _number, _score, _grade, _class));
    }

    function getStudentbyNumber(uint _number) public view returns (Student memory) {
        return Class[_number - 1];
    }

    function getStudentbyString(string memory _name) public view returns (Student memory) {
        return NameToClass[_name];
    }

    function getStudentScore(string memory _name) public view returns (uint) {
        return NameToClass[_name].score;
    }

    function getStudentNumber() public view returns (uint) {
        return Class.length;
    }

    function getStudentInfo() public view returns (Student[] memory) {
        return Class;
    }

    function setAverage() public view returns(uint) {
        uint sum;
        uint average;
        for(uint i = 0; i < Class.length; i++) {
            sum += Class[i].score;
        }
        average = sum / Class.length;
        return average;
    }

    function getTrueOrFalse() public view returns(bool) {
        uint average = setAverage();
        if(average >= 70) {
            return true;
        } else {
            return false;
        }
    }

    // function getFClass() public view returns(Student[] memory) {
    //     uint count;
    //     Student[] memory FClass = new Student[]();
    //     for(uint i = 0; i < Class.length; i++) {
    //         if(keccak256(bytes(Class[i].grade)) == keccak256(bytes("K"))) {
    //             FClass[count] = Class[i];
    //         }
    //     }
    //     return FClass;
    // }

    // function setSclassInfo() public view returns (Student[4] memory){
    //     uint count = 4;
    //     Student[4] memory sClass;
    //     for(uint i = 0; i < Class.length; i++){
    //         for (uint j = 0; j < count; j++) {
    //             if(Class[i].score > sClass[j].score) {
    //                 sClass[j] = Class[i];
    //             }
    //         }
    //     }
    //     return sClass;
    // }
}

contract codingtestAnswer {
    /*
    Alice, 1, 85
    Bob,2, 75
    Charlie,3,60
    Dwayne, 4, 90
    Ellen,5,65
    Fitz,6,50
    Garret,7,80
    Hubert,8,90
    Isabel,9,100
    Jane,10,70
    */

    // 학생의 정보는 이름, 번호, 점수, 학점 그리고 듣는 수업들이 포함
    struct Student {
        string name;
        uint number;
        uint score;
        string credit;
        string[] classes;
    }
    Student[] students;

    // 학점은 점수에 따라 자동으로 계산되어 기입하게 합니다. 90점 이상 A, 80점 이상 B, 70점 이상 C, 60점 이상 D, 나머지는 F 입니다.
    function setCredit(uint _score) public pure returns(string memory) {
        if(_score >= 90) {
           return "A";
        } else if (_score >= 80) {
            return "B";
        } else if (_score >= 70) {
            return "C";
        } else if (_score >= 60) {
            return "D";
        } else {
            return "F";
        }
    }

    // 학생 추가 기능 - 특정 학생의 정보를 추가
    // 번호는 1번부터 시작하여 정보를 기입하는 순으로 순차적으로 증가합니다.
    function pushStudent(string memory _name, uint _score, string[] memory _classes) public {
        students.push(Student(_name, students.length + 1, _score, setCredit(_score), _classes));
        name_Student[_name] = Student(_name, students.length, _score, setCredit(_score), _classes);
    }

    // 학생 전체 숫자 조회 기능 - 현재 등록된 학생들의 숫자를 반환
    function getStudentsNumber() public view returns(uint) {
        return students.length;
    }

    // 학생 전체 정보 조회 기능 - 현재 등록된 모든 학생들의 정보를 반환
    function getAllStudents() public view returns(Student[] memory) {
        return students;
    }

    // 학생 조회 기능(1) - 특정 학생의 번호를 입력하면 그 학생 전체 정보를 반환
    function getStudentByNum(uint _number) public view returns(Student memory) {
        return students[_number - 1];
    }

    // 학생 조회 기능(2) - 특정 학생의 이름을 입력하면 그 학생 전체 정보를 반환
    mapping(string => Student) name_Student;

    function getStudentByName(string memory _name) public view returns(Student memory) {
        return name_Student[_name];
    }

    // 학생 점수 조회 기능 - 특정 학생의 이름을 입력하면 그 학생의 점수를 반환
    function getStudentScore(string memory _name) public view returns(uint) {
        return name_Student[_name].score;
    }

    // 학생들의 전체 평균 점수 계산 기능 - 학생들의 전체 평균 점수를 반환
    function getAverageScore() public view returns (uint) {
        uint totalScore;
        uint averageScore;
        for(uint i = 0; i < students.length; i++) {
            totalScore += students[i].score;
        }
        averageScore = totalScore / students.length;
        return averageScore;
    }

    // 선생 지도 자격 자가 평가 시스템 - 학생들의 평균 점수가 70점 이상이면 true, 아니면 false를 반환
    function selfEva() public view returns (bool) {
        if(getAverageScore() >= 70) {
            return true;
        } else {
            return false;
        }
    }

    // 보충반 조회 기능 - F 학점을 받은 학생들의 숫자와 그 전체 정보를 반환
    function FClass() public view returns(Student[] memory) {
        uint num;       // F 학점 학생수
        
        for(uint i = 0; i < students.length; i++) {
            if(keccak256(bytes(students[i].credit)) == keccak256(bytes("F"))) {
                num++;
            }
        }

        Student[] memory F_Storage = new Student[](num);       // num만틈의 array

        uint _num;
        for(uint i = 0; i < students.length; i++) {
            if(keccak256(bytes(students[i].credit)) == keccak256(bytes("F"))) {
                F_Storage[_num] = students[i];
                _num++;
            }
        }

        return F_Storage;
    }

    function FClass1() public view returns(uint, uint, Student[] memory) {
        Student[] memory F_Students = students;
        Student[] memory F_Storage;

        uint count;

        for(uint i = 0; i < students.length; i++) {
            if(keccak256(bytes(students[i].credit)) == keccak256(bytes("F"))) {
                count++;
                F_Students[count-1] = students[i];
                F_Storage = new Student[](count);
                for(uint j = 0; j < count; j++) {
                    F_Storage[j] = F_Students[j];
                }
            }
        }
        return (F_Storage.length, count, F_Storage);
    }

    // S반 조회 기능 - 가장 점수가 높은 학생 4명을 S반으로 설정하는데, 이 학생들의 전체 정보를 반환하는 기능 (S반은 4명으로 한정)
    function SClass() public view returns(Student[] memory) {
        Student[] memory S_Students = students;
        Student[] memory S_Class = new Student[](4);

        for(uint j = 1; j < S_Students.length; j++) {
            for(uint i = 0; i < j; i++) {
                if(S_Students[i].score < S_Students[j].score) {
                    (S_Students[i], S_Students[j]) = (S_Students[j], S_Students[i]);
                }
            }
        }
        for(uint i = 0; i < 4; i++) {
            S_Class[i] = S_Students[i];
        }
        return S_Class;
    }
}

contract STRING_Compare {
    function keccak1(string memory _string) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_string));
    }

    function keccak2(string memory _string) public pure returns(bytes32) {
        return keccak256(bytes(_string));
    }

    function compare1(string memory s1, string memory s2) public pure returns(bool) {
        return keccak256(bytes(s1)) == keccak256(bytes(s2));
    }

    function compare2(string memory s1) public pure returns(bytes memory, bytes memory) {
        return (abi.encodePacked(s1), bytes(s1));
    }

    // function stringCompare(string memory _string1, string memory _string2) public pure returns(bool) {
    //     return (_string1 == _string2);
    // }

    function stringCompare2(string memory _string1, string memory _string2) public pure returns(bool) {
        return keccak256(abi.encodePacked(_string1)) == keccak256(abi.encodePacked(_string2));
    }

    function stringCompare3(string memory _string1, string memory _string2) public pure returns(bool) {
        return keccak256(bytes(_string1)) == keccak256(bytes(_string2));
    }

    
}

contract DynamicArray {
    function DA() public pure returns(uint) {
        string[] memory a = new string[](4);

        a = new string[](6);
        return a.length;
    }
}

contract codingRetest{
    /*
    Alice, 1, 85
    Bob,2, 75
    Charlie,3,60
    Dwayne, 4, 90
    Ellen,5,65
    Fitz,6,50
    Garret,7,80
    Hubert,8,90
    Isabel,9,100
    Jane,10,70
    */

    // 학생의 정보는 이름, 번호, 점수, 학점 그리고 듣는 수업들이 포함되어야 합니다.
    struct Student {
        string name;
        uint number;
        uint score;
        string grade;
        // string[] classes;
    }

    Student[] class;
    mapping (string => Student) NameToString;

    // 학생 추가 기능 - 특정 학생의 정보를 추가
    // 번호는 1번부터 시작하여 정보를 기입하는 순으로 순차적으로 증가합니다.
    // 학점은 점수에 따라 자동으로 계산되어 기입하게 합니다. 90점 이상 A, 80점 이상 B, 70점 이상 C, 60점 이상 D, 나머지는 F 입니다.
    function pushStudent(string memory _name, uint _score) public {
        string memory _grade;
        if(_score >= 90) {
            _grade = "A";
        } else if(_score >= 80) {
            _grade = "B";
        } else if(_score >= 70) {
            _grade = "C";
        } else if(_score >= 60) {
            _grade = "D";
        } else {
            _grade = "F";
        }
        class.push(Student(_name, class.length+1, _score, _grade));
        NameToString[_name] = Student(_name, class.length, _score, _grade);
    }

    // 학생 조회 기능(1) - 특정 학생의 번호를 입력하면 그 학생 전체 정보를 반환
    function getStudentbyNumber(uint _number) public view returns(Student memory) {
        return class[_number-1];
    }

    // 학생 조회 기능(2) - 특정 학생의 이름을 입력하면 그 학생 전체 정보를 반환
    function getStudentbyName(string memory _name) public view returns(Student memory) {
        return NameToString[_name];
    }

    // 학생 점수 조회 기능 - 특정 학생의 이름을 입력하면 그 학생의 점수를 반환
    function getStudentScorebyName(string memory _name) public view returns(uint) {
        return NameToString[_name].score;
    }

    // 학생 전체 숫자 조회 기능 - 현재 등록된 학생들의 숫자를 반환
    function getStudentNumber() public view returns(uint) {
        return class.length;
    }

    // 학생 전체 정보 조회 기능 - 현재 등록된 모든 학생들의 정보를 반환
    function getAllStudents() public view returns(Student[] memory) {
        return class;
    }

    // 학생들의 전체 평균 점수 계산 기능 - 학생들의 전체 평균 점수를 반환
    function getAverageScore() public view returns(uint) {
        uint sum;
        uint average;
        for(uint i = 0; i < class.length; i++) {
            sum += class[i].score;
        }
        average = sum / class.length;
        return average;
    }

    // 선생 지도 자격 자가 평가 시스템 - 학생들의 평균 점수가 70점 이상이면 true, 아니면 false를 반환
    function getTrueOrFalse() public view returns(bool) {
        if(getAverageScore() >= 70) {
            return true;
        } else {
            return false;
        }
    }

    // 보충반 조회 기능 - F 학점을 받은 학생들의 숫자와 그 전체 정보를 반환
    function getFClass() public view returns(uint, Student[] memory) {
        uint count;
        for(uint i = 0; i < class.length; i++) {
            if(keccak256(bytes(class[i].grade)) == keccak256(bytes("F"))){
                count++;
            }
        }
        Student[] memory F_Class = new Student[](count);
        uint _count;
        for(uint i = 0; i < class.length; i++) {
            if(keccak256(bytes(class[i].grade)) == keccak256(bytes("F"))){
                F_Class[_count] = class[i];
                _count++;
            }
        }
        return (F_Class.length, F_Class);
    }

    // -------------------------------------------------------------------------------

    // S반 조회 기능 - 가장 점수가 높은 학생 4명을 S반으로 설정하는데, 이 학생들의 전체 정보를 반환하는 기능 (S반은 4명으로 한정)
    function getSClass() public view returns(Student[4] memory) {
        Student[] memory CopyClass = class;
        Student[4] memory SClass;

        for(uint i = 0; i < CopyClass.length; i++) {
            for(uint j = i+1; j < CopyClass.length; j++) {
                if(CopyClass[i].score < CopyClass[j].score) {
                    (CopyClass[i], CopyClass[j]) = (CopyClass[j], CopyClass[i]);
                }  
            }
        }

        for(uint i = 0; i < SClass.length; i++) {
            SClass[i] = CopyClass[i];
        }
        return SClass;
    }

}