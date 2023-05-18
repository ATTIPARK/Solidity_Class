// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Sorting {
    uint[] numbers;

    function push(uint _n) public {
        numbers.push(_n);
    }

    function sortingUp() public {
        for(uint i = 0; i < numbers.length - 1; i++) {
            for(uint j = i + 1; j < numbers.length; j++) {
                if(numbers[i] < numbers[j]) {
                    (numbers[i], numbers[j]) = (numbers[j], numbers[i]);
                }
            }
        }
    }

    function sortingUp2() public {
        for(uint j = 1; j < numbers.length; j++) {
            for(uint i = 0; i < j; i++) {
                if(numbers[i] < numbers[j]) {
                    (numbers[i], numbers[j]) = (numbers[j], numbers[i]);
                }
            }
        }
    }

    function sortingDown() public {
        for(uint i = 0; i < numbers.length - 1; i++) {
            for(uint j = i + 1; j < numbers.length; j++) {
                if(numbers[i] > numbers[j]) {
                    (numbers[i], numbers[j]) = (numbers[j], numbers[i]);
                }
            }
        }
    }

    function get() public view returns(uint[] memory) {
        return numbers;
    }
}