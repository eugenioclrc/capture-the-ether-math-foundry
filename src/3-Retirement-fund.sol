pragma solidity ^0.7.6;

contract RetirementFundChallenge {
    uint256 startBalance;
    address owner = msg.sender;
    address beneficiary;
    uint256 expiration = block.timestamp + 10 * 365 days;

    constructor(address player) payable {
        require(msg.value == 1 ether, "lock 1 ether please");

        beneficiary = player;
        startBalance = msg.value;
    }

    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function withdraw() public {
        require(msg.sender == owner, "only owner");

        if (block.timestamp < expiration) {
            // early withdrawal incurs a 10% penalty
            msg.sender.transfer(address(this).balance * 9 / 10);
        } else {
            msg.sender.transfer(address(this).balance);
        }
    }

    function collectPenalty() public {
        require(msg.sender == beneficiary);

        uint256 withdrawn = startBalance - address(this).balance;

        // an early withdrawal occurred
        require(withdrawn > 0, "no early withdrawn err");

        // penalty is what's left
        msg.sender.transfer(address(this).balance);
    }

}