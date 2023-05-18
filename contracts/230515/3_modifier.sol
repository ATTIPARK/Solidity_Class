// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MODIFIER{
    uint a;

    modifier lessThanFive() {
        require(a<5, "should be less than five");
        _;      // 함수가 실행되는 시점
    }

    function aPlus() public {
        a++;
    }

    function aMinus() public {
        a--;
    }

    function getA() public view returns(uint) {
        return a;
    }

    function doubleA() public lessThanFive {
        a = a*2;
    }

    function plusTem() public lessThanFive {
        a += 10;
    }
}

contract MODIFIER2{
    uint a;

    modifier plusOneBefore() {
        a++;
        _;
    }

    modifier  plusOneAfter() {
        _;
        a++;
    }

    function setA() public plusOneBefore returns(string memory) {
        if(a >= 3) {
            return "A";
        } else {
            return "B";
        }
    }

    function setA2() public plusOneAfter returns(string memory) {
        if(a >= 3) {
            return "A";
        } else {
            return "B";
        }
    }

    function getA() public view returns(uint) {
        return a;
    }

    function setAasTwo() public {
        a = 2;
    }
}

contract MODIFIER3 {
    /*
    실습가이드
    1. setAasTwo()로 a 값 2로 만들기
    2. setA() 실행 후, getB2() 실행해서 결과 보기
    */
    uint a;
    string b;
    string[] b2;

    modifier plusOneBefore() {
        _;
        a++;
        _;
    }

    function setA() public plusOneBefore  {
        if(a>=3) {
            b = "A";
            b2.push(b);
        } else {
            b = "B";
            b2.push(b);
        }
    }

    function getA() public view returns(uint) {
        return a;
    }

    function getB() public view returns(string memory) {
        return b;
    }

    function getB2() public view returns(string[] memory) {
        return b2;
    }

    function setAasTwo() public {
        a = 2;
    }
}

contract MODIFIER4 {
    struct Person {
        uint age;
        string name;
    }

    Person P;

    modifier overTwenty(uint _age, string memory _criminal) {
        require(_age >20, "Too young");
        require(keccak256(abi.encodePacked(_criminal)) != keccak256(abi.encodePacked("Bob")), "Bob is criminal. She can't buy it");
        _;
    }

    function buyCigar(uint _a, string memory _name) public pure overTwenty(_a, _name) returns(string memory) {
        return "Passed";
    }

    function buyAlcho(uint _a, string memory _name) public pure overTwenty(_a, _name) returns(string memory) {
        return "Passed";
    }

    function buyGu(uint _a, string memory _name) public pure overTwenty(_a, _name) returns(string memory) {
        return "Passed";
    }

    function setP(uint _age, string memory _name) public {
        P = Person(_age, _name);
    }

    function getP() public view returns(Person memory) {
        return P;
    }

    function buyCigar2() public overTwenty(P.age, P.name) view returns(string memory) {
        return "Passed";
    }

    function buyAlcho2() public overTwenty(P.age, P.name) view returns(string memory) {
        return "Passed";
    }

    function buyGu2() public overTwenty(P.age, P.name) view returns(string memory) {
        return "Passed";
    }

}

contract MODIFIER5 {
    uint mutex = 0;
   
   modifier m_check {
       mutex++;
       _;
       mutex--;
   }

   modifier shoudBeZero {
       require(mutex==0, "someone is using");
       _;
   }

   function inAndOut() public m_check returns(string memory) {
       return "Done";
   }

    function inAndOut2() public m_check shoudBeZero returns(string memory) {
       return "Done";
   }

    function inAndOut3() public shoudBeZero m_check returns(string memory) {
       return "Done";
   }

   function occupy() shoudBeZero public {
       mutex++;
   }

   function vacancy() public {
       mutex--;
   }
}