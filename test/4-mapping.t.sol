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

        // tu codigo aca
        
        assertTrue(target.isComplete());
    }
}
