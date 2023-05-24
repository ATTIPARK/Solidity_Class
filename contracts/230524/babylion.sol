// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/*
1.
월 과 일을 input 값으로 받아서 이 날짜가 1년중 몇번쨰 날인지를 반환해주는 함수를 만드시오.
uint[12] daysPerMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
*/
contract Q1 {
    uint[12] daysPerMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    function getDays(uint month, uint day) public view returns(uint) {
        require(month >= 1 && month <= 12);
        require(day >= 1 && day <= daysPerMonth[month-1]);
        
        uint currentDay = day;

        for(uint i = 0; i < month-1; i++) {
            currentDay += daysPerMonth[i];
        }

        return currentDay;
    }
}

/*
2.
호텔을 예약하려 합니다. 이름, 방번호, 사람 수가 들어간 구조체를 만드세요.
방의 상태는 예약 가능과 예약됨으로 되어있습니다.
이름을 통해 예약자 명단을 확인할 수 있습니다.

* 예약하기 - 각 정보를 기입해 예약할 수 있는 함수를 만드세요. 예약금은 1 ether이며 예약 시 예약됨으로 변경되어야 합니다.
* 예약 조회 - 이름을 통해 예약을 조회할 수 있는 함수를 만드세요.
* 예약 취소 - 예약자 명단에서 지우고 예약시 지불금의 70%를 반환하는 함수를 구하세요.
*/
contract Q2 {
    struct guest {
        string name;
        uint roomNumber;
        uint peopleNumber;
        bool isReserved;
    }

    mapping (string=>guest) Guest;

    function makeReservation(string memory _name, uint _roomNum, uint _peopleNum) public payable {
        require(msg.value == 1 ether && !Guest[_name].isReserved);

        Guest[_name] = guest(_name, _roomNum, _peopleNum, true);
    }

    function getReservation(string memory _name) public view returns(guest memory) {
        return Guest[_name];
    }

    function cancelReservation(string memory _name) public {
        require(keccak256(bytes(Guest[_name].name)) == keccak256(bytes(_name)));

        uint refund = (1 ether * 70) / 100;
        payable(msg.sender).transfer(refund);
        delete Guest[_name];
    }
}

/*
3.
A스마트 컨트랙트의 주인은 owner입니다.
owner가 A컨트랙트로부터 출금할 수 있는 기능을 만들고자 합니다.
위 출금 함수는 A컨트랙트의 주소 16진수 중 0x 다음 첫글자가 숫자로 시작하면 1ether,
아니면 2ether를 출금되도록 합니다.
*/
contract Q3 {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function withdraw() public view returns (address, bytes memory, bytes1, uint8) {
        require(owner == msg.sender);

        uint amount;
        bytes memory addressToBytes = abi.encodePacked(address(this));
        bytes1 firstLetter = addressToBytes[0];
        
        // if(값이 아스키 코드상 48이상 57이하여야함) {
        //     amount = 1 ether;
        // } else {
        //     amount = 2 ether;
        // }

        return (address(this), addressToBytes, firstLetter, uint8(firstLetter));
    }
}