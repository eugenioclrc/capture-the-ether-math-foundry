// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.6;

import "forge-std/Test.sol";
import "../src/2-Token-whale.sol";

contract Challenge2Test is Test {
    TokenWhaleChallenge target;
    address player = vm.addr(1);

    function setUp() public {
        target = new TokenWhaleChallenge(player);
        vm.label(address(target), "Challenge");
        vm.label(player, "Player");
    }

    function testExample() public {
        vm.startPrank(address(player));

        // tu codigo aca
        
        assertTrue(target.isComplete());
    }
}
