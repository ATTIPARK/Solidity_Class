// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract INITIALIZATION {
    uint a;
    string b;
    address c;
    bytes1 d;
    bytes e;
    bool f;

    struct set1 {
        uint a;
        string b;
        address c;
        bytes32 d;
        bytes e;
        bool f;
    }

    set1 public S1;
    set1[] group1;

    uint[] g;
    string[] h;
    bytes1[4] i;
    uint[4] j;
    address[4] k;
    string[4] l;

    struct set2 {
        uint[] g;
        string[] h;
        bytes1[4] i;
        /*uint[4] j;
        address[4] k;
        string[4] l;*/
    }

    set2 s2;

    set2[] group2;

    function pushG1() public {
        group1.push(set1(0,"",address(0),bytes32(0),new bytes(0),false));
    }

    function pushG2() public {
        bytes1[4] memory _i;
        group2.push(set2(new uint[](0),new string[](0), _i));
    }

    function getG2() public  view returns(set2[] memory) {
        return group2; // 0: tuple(uint256[],string[],bytes1[4])[]:
    }

    function getS2() public view returns(set2 memory) {
        return s2;
    }

    function getA() public view returns(uint,string memory, address, bytes1, bytes memory, bool) {
        return (a,b,c,d,e,f);
    }

    function getG() public view returns(uint[] memory, string[] memory, bytes1[4] memory, uint[4] memory, address[4] memory, string[4] memory) {
        return (g,h,i,j,k,l );
    }
}