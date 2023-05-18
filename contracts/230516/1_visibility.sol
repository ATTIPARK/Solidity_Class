// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract VISIBILITY {

    function privateF() private pure returns(string memory) {
        return "private";
    }

    function testPrivateF() public pure returns(string memory) {
        return privateF();
    }

    function testPrivateF2() internal pure returns(string memory) {
        return privateF();
    }

    function internalF() internal pure returns(string memory) {
        return "internal";
    }

    function testInternalF() public pure returns(string memory) {
        return internalF();
    }

    function publicF() public pure returns(string memory) {
        return "public";
    }

    function externalF() external pure returns(string memory) {
        return "external";
    }
}

contract VISIBILITY_Child is VISIBILITY {

    function testPrivateF_1() public pure returns(string memory) {
        return testPrivateF();
    }

    function testPrivateF_2() public pure returns(string memory) {
        return testPrivateF2();
    }

    function testInternal2() public pure returns(string memory) {
        return internalF();
    }

    function testPublic() public pure returns(string memory) {
        return publicF();
    }
}

contract Outsider {
    VISIBILITY vs = new VISIBILITY();

    function getExternalFromVS() public view returns(string memory) {
        return vs.externalF();
    }

    function getPublicFromVS() public view returns(string memory) {
        return vs.publicF();
    }
}

contract Parent {
    function add(uint a, uint b) public pure returns(uint) {
        return a+b;
    }
}

contract ChilD is Parent {
    function multiply(uint a, uint b) public pure returns(uint) {
        return a*b;
    }
}

contract DAD {
    uint a;

    uint public wallet=100; // 공개한 지갑 잔액
    uint internal crypto=1000; // 메모장에 private key가 있는 크립토 잔액
    uint private emergency=10000; // 진짜 비상금

    function who() virtual public pure returns(string memory) {
        return "dad from DAD";
    }

    function name() internal pure returns(string memory) {
        return "David";
    }

    function password() private pure returns(uint) {
        return 1234;
    }

    function character() external pure returns(string memory) {
        return "not good";
    }

    function getAddress() public view returns(address) {
        return address(this);
    }
}

contract MOM {
    DAD husband = new DAD();
    function who() virtual public pure returns(string memory) {
        return "mom from MOM";
    }

    function getHusbandChar() public view returns(string memory) {
        return husband.character();
    }

    function getWallet() public view returns(uint) {
        return husband.wallet();
    }

    function husbandAddress() public view returns(address) {
        return address(husband);
    }

    function husbandAddress2() public view returns(address) {
        return husband.getAddress();
    }

    /*
    Visibility에서 차단
    function getCrypto() public view returns(uint) {
        return husband.crypto();
    }

    function getEmergency() public view returns(uint) {
        return husband.emergency();
    }
    */
}

contract Child1 is DAD {
    function who() override public pure returns(string memory) {
        return super.who();
        // return "child from CHILD";
    }

    function fathersName() public pure returns(string memory) {
        return super.name();
    }

    function fathersWallet() public view returns(uint) {
        return DAD.wallet;
    }

    function fathersCrypto() public view returns(uint) {
        return DAD.crypto;
    }

    function fathersAddress() public view returns(address) {
        return DAD.getAddress();
    }

    function fathersAddress2() public view returns(address) {
        return super.getAddress();
    }

    DAD daddy = new DAD();
    DAD daddy2 = new DAD();

    /*function fathersName2() public pure returns(string memory) {
        return daddy.name();
    }*/

    function fathersWallet2() public view returns(uint) {
        return daddy.wallet();
    }

    /*function fathersCrypto2() public view returns(uint) {
        return daddy.crypto();
    }*/

    function getDaddyAddress() public view returns(address) {
        return address(daddy);
    }

    function getDaddy2Address() public view returns(address) {
        return address(daddy2);
    }

    /*
    Visibility - private 막힘
    function fathersEmergency() public view returns(uint) {
        return DAD.emergency;
    }
    */

    /*
    오류 발생 상속받은 아이는 external 접근 불가능
    function fathersChar() public pure returns(string memory) {
        return super.character();
    }
    */

    /*
    오류 발생 password는 private 함수
    function password_Dad() public pure returns(uint) {
        return super.password();
    }
    */
}

contract Child2 is DAD, MOM {
    function who() virtual override(DAD, MOM) public pure returns(string memory) {
        return super.who();
        // return "child from CHILD";
    }
}

/*
contract DAD {
    function who() virtual public pure returns(string memory) {
        return "dad from DAD";
    }

    function name() internal pure returns(string memory) {
        return "David";
    }

    function password() private pure returns(uint) {
        return 1234;
    }
}

contract MOM {
    function who() virtual public pure returns(string memory) {
        return "mon from MOM";
    }
}

contract CHILD is DAD {
    function who() override public pure returns(string memory) {
        return super.who();
    }

    function fatherName() public pure returns(string memory) {
        return super.name();
    }
}

contract CHILD2 is DAD, MOM {
    function who() virtual override(DAD, MOM) public pure returns(string memory) {
        return super.who();
    }
}

contract CHILD2_2 is MOM, DAD {
    function who() virtual override(MOM, DAD) public pure returns(string memory) {
        return super.who();
    }
}

contract CHILD3 is DAD {
    function who() override public pure returns(string memory) {
        return "child from CHILD";
    }
    function who(uint a) public pure returns(string memory, uint) {
        return ("dad from CHILD", a);
    }
}
*/