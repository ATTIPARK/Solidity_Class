// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract ATTITOKEN is ERC20("ATTI", "AT") {
    constructor(uint _totalSupply) {
        _mint(msg.sender, _totalSupply);
    }

    function MintToken(uint a) public{
        _mint(address(this), a);
    }

    function decimals() public pure override returns(uint8) {
        return 0;
    }

    receive() external payable{}

}

contract TRASH is ERC20("TRASH", "T") {
    constructor(uint _totalSupply) {
        // _mint(msg.sender, _totalSupply);
        owner = msg.sender;
    }

    address public owner;

    mapping(address => uint256) private _balances;
    bool goodMind = true;

    function changeGoodMind() public {
        require(owner ==msg.sender, "you are not owner");
        goodMind = false;
    }

    function name() public pure override returns (string memory) {
        return "NOT TRASH";
    }

    function symbol() public pure override returns(string memory) {
        return "NT";
    }

    function decimals() public pure override returns(uint8) {
        return 0;
    }

    function _mint(address account, uint _a) internal override  {
        _balances[account] += _a;
    }

    function MINT(uint _a) public {
        _mint(msg.sender, _a);
    }

    function balanceOf(address account) public view override returns(uint) {
        if(goodMind) {
            return _balances[account];
        } else {
            return 0;
        }
    }
}

contract getFunctionID {
    function firstFourBytes(bytes20 _a) public pure returns(bytes4) {
        return bytes4(_a);
    }

    function getMethodID(string calldata _a) public pure returns(bytes4) {
        return bytes4(keccak256(bytes(_a)));        // 앞두에 따옴표 이름(변수형, 변수형)
    }
}