// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";


contract MotJa {
    struct balance {
        uint finalBalance;
        uint currentBalance;
    }

    mapping(address=>mapping(string=>balance)) private Charge;

    receive() external payable{}        // 컨트렉트가 돈을 받을수 있는 함수

    function setUser(string memory _present, uint _balance) public {                    // 선물 등록 함수
        require(Charge[msg.sender][_present].finalBalance==0);
        Charge[msg.sender][_present].finalBalance = _balance;
    }

    function getUser(string memory _present) public view returns(balance memory) {      // 금액 확인 테스트용
        return Charge[msg.sender][_present];
    }

    function getRatio(address _addr, string memory _present) public view returns(uint) {            // 금액 달성치 반환 함수
        return Charge[_addr][_present].currentBalance * 100 / Charge[_addr][_present].finalBalance;
    }

    function chargeBalance(address _addr, string memory _present, uint _balance) public {           // 돈 충전하는 함수
        require(Charge[_addr][_present].currentBalance < Charge[_addr][_present].finalBalance);
        Charge[_addr][_present].currentBalance += _balance;

        if(Charge[_addr][_present].currentBalance >= Charge[_addr][_present].finalBalance) {
            uint remain = Charge[_addr][_present].currentBalance - Charge[_addr][_present].finalBalance;
            payable(_addr).transfer(remain);
        }
    }

    // function mint() public {}

}



contract NFT is ERC721Enumerable {
    string public URI;
    
    // 생일 당사자의 주소를 받아와서 당일날 00시부터 NFT를 민팅해갈수 있게 한다

    constructor(string memory _uri) ERC721("BirthdayNFT", "HBN") {
        URI = _uri;
    }

    function mintNFT(uint _tokenID) public {
        _mint(msg.sender, _tokenID);
    }

    function tokenURI(uint _tokenID) public override view returns(string memory) {
        return string(abi.encodePacked(URI, '/', Strings.toString(_tokenID), '.json'));
    }
}

contract MotJa2 {
    struct balance {
        uint finalB;
        uint currentB;
    }

    // mapping address(메타마스크 주소) => uint(몇번쨰 선물) => 가격   PRESENT
    mapping(address=>mapping(uint=>balance)) private PRESENT;

    // 선물 등록 함수
    function setPresent(address addr, uint num, uint price) public {
        require(PRESENT[addr][num].finalB == 0);
        PRESENT[addr][num].finalB = price;
    }

    // 돈 충전하는 함수
    function chargeBalance(address addr, uint num, uint price) public {
        require(PRESENT[addr][num].currentB < PRESENT[addr][num].finalB);
        PRESENT[addr][num].currentB += price;
        // 그리고 그 금액만큼 contract에 보내주기

        if(PRESENT[addr][num].currentB > PRESENT[addr][num].finalB) {
            uint remain = PRESENT[addr][num].currentB - PRESENT[addr][num].finalB;
            // remain을 contract에서 생일당사자에게 보내주기
        }
    }

    // 금액 달성치를 반환해주는 함수
    function getRation(address addr, uint num) public view returns(uint) {
        return PRESENT[addr][num].currentB * 100 / PRESENT[addr][num].finalB;
    }
}