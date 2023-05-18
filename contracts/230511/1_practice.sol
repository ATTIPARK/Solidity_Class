// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Practice2 {
    uint[10] fixedArray;
    uint[] infinityArray;
    uint count;

    function setFixedArray(uint _number) public {
        fixedArray[count++] = _number;
    }

    function setInfinityArray(uint _number) public {
        infinityArray.push(_number);
    }

    function changeNumber(uint _n, uint _number) public {
        infinityArray[_n -1] = _number;
    }

    function addArray() public view returns (uint){
        uint sum;
        for(uint i = 0; i < fixedArray.length; i++) {
            sum += fixedArray[i];
        }
        return sum;
    }
}

contract Practice1 {
    mapping (uint => uint) NumToNum;
    mapping (string => uint) StrToNum;

    struct Wallet {
        string name;
        uint number;
        address account;
    }

    mapping (string => Wallet) StrToWallet;

    Wallet[] wallets;

    function setWallets(string memory _name, uint _number, address _account) public {
        wallets.push(Wallet(_name, _number, _account));
    }

    function getWallet(uint _number) public view returns (Wallet memory) {
        return wallets[_number - 1];
    }

    function getWalletAccount(uint _number) public view returns (address) {
        return wallets[_number - 1].account;
    }

    function getWallets() public view returns (Wallet[] memory) {
        return wallets;
    }
}