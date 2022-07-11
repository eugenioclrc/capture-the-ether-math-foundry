pragma solidity ^0.7.6;

contract TokenSaleChallenge {
    mapping(address => uint256) public balanceOf;
    uint256 constant PRICE_PER_TOKEN = 1 ether; // 1e18

    constructor() payable {
        require(msg.value == 1 ether, "need 1 ether to deploy");
    }

    function isComplete() external view returns (bool) {
        return address(this).balance < 1 ether;
    }

    function buy(uint256 numTokens) external payable {
        require(msg.value == numTokens * PRICE_PER_TOKEN, "math error");

        balanceOf[msg.sender] += numTokens;
    }

    function sell(uint256 numTokens) external {
        require(balanceOf[msg.sender] >= numTokens);

        balanceOf[msg.sender] -= numTokens;
        msg.sender.transfer(numTokens * PRICE_PER_TOKEN);
    }
}