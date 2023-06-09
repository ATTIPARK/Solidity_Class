// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract TIME {
    function currentTime() public view returns(uint) {
        return block.timestamp;
    }

    function getTime() public view returns(uint) {
        return block.timestamp + 100;
    }

    function getTime2() public view returns(uint) {
        return block.timestamp + 10 seconds;
    }

    function getTime3() public view returns(uint) {
        return block.timestamp + 10 minutes;
    }

    function getTime4() public view returns(uint) {
        return block.timestamp + 1 hours;
    }

    function getTime5() public view returns(uint) {
        return block.timestamp + 1 days;
    }

    function getTime6() public view returns(uint) {
        return block.timestamp + 1 weeks;
    }

    // function getTime7() public view returns(uint) {
    //     return block.timestamp + 1 years;        // 0.5.0 부터 없어짐
    // }
}

// 608060405234801561001057600080fd5b506102a7806100206000396000f3fe608060405234801561001057600080fd5b506004361061007d5760003560e01c806395c48e891161005b57806395c48e89146100dc5780639a7738e0146100fa578063d18e81b314610118578063dec6fa54146101365761007d565b8063557ed1ba14610082578063646c8b31146100a05780637d2dbac8146100be575b600080fd5b61008a610154565b60405161009791906101f3565b60405180910390f35b6100a8610168565b6040516100b591906101f3565b60405180910390f35b6100c661017d565b6040516100d391906101f3565b60405180910390f35b6100e4610193565b6040516100f191906101f3565b60405180910390f35b6101026101a9565b60405161010f91906101f3565b60405180910390f35b6101206101bd565b60405161012d91906101f3565b60405180910390f35b61013e6101c5565b60405161014b91906101f3565b60405180910390f35b6000606442610163919061023d565b905090565b6000610e1042610178919061023d565b905090565b600062093a804261018e919061023d565b905090565b600062015180426101a4919061023d565b905090565b6000600a426101b8919061023d565b905090565b600042905090565b6000610258426101d5919061023d565b905090565b6000819050919050565b6101ed816101da565b82525050565b600060208201905061020860008301846101e4565b92915050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052601160045260246000fd5b6000610248826101da565b9150610253836101da565b925082820190508082111561026b5761026a61020e565b5b9291505056fea2646970667358221220826baadf65be070226ed089d8f27ad9249a4e09060ae88bab7c07cb88e7defea64736f6c63430008120033
contract ADDRESS {
    function getBalance(address _a) public view returns(uint) {
        return _a.balance;
    }

    function getCode(address _a) public view returns(bytes memory) {
        return _a.code;
    }

    function getCodeHash(address _a) public view returns(bytes32) {
        return _a.codehash;
    }

    function transferAsset(address payable _a) public {
        _a.transfer(100);
    }

    function sendAsset(address payable _a) public returns(bool) {
        return _a.send(100);
    }
}