// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ENUM1 {
    enum Food {
        Chicken,
        Sushi,
        Bread,
        Pizza
    }

    Food a;
    Food b;
    Food c;
    Food d;

    function setA() public {
        a = Food.Chicken;
    }

    function setB() public {
        b = Food.Sushi;
    }

    function setC() public {
        c = Food.Bread;
    }

    function setD() public {
        d = Food.Pizza;
    }

    function getABC() public view returns (Food, Food, Food, Food) {
        return (a,b,c,d);
    }

    function getABC2() public view returns (uint8, uint8, uint8, uint8) {
        return (uint8(a),uint8(b),uint8(c),uint8(d));
    }

}

contract ENUM2 {
    enum color{
        red,
        yellow,
        green,
        blue,
        purple,
        rainbow
    }

    color c;

    function setC() public {
        c = color.red;
    }

    function setC2(uint _n) public {
        c = color(_n);
    }

    function getC() public view returns (color) {
        return c;
    }
}

contract ENUM3 {
    enum Status {
        neutral,
        high,
        low
    }
    Status st;

    uint a = 5;

    function higher() public {
        a++;
        setStatus();
    }

    function lower() public {
        a--;
        setStatus();
    }

    function getA() public view returns(uint, Status) {
        return (a, st);
    }

    function setStatus() public {
        if(a >= 7) {
            st = Status.high;
        } else if(a <= 3) {
            st = Status.low;
        } else {
            st = Status.neutral;
        }
    }
}

contract ENUM4 {
    enum Fruits {
	    apple,
	    banana,
	    peach,
	    kiwi
    }

    Fruits A = Fruits.apple;
}