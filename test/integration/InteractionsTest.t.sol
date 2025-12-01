// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
import {FundFundMe, WithdrawFundMe} from "../../script/Interactions.s.sol";

contract FundMeTestIntegration is Test {
    FundMe public fundMe;
    address private user = makeAddr("user"); // this is a helper function to create a random address
    uint256 private constant STARTING_BALANCE = 10 ether;
    uint256 private constant SEND_VALUE = 0.1 ether;

    function setUp() public {
        DeployFundMe deploy = new DeployFundMe();
        fundMe = deploy.run();
        vm.deal(user, STARTING_BALANCE); // give USER some ETH
    }

    function testUserCanFundInteractions() public {
        FundFundMe fundFundMe = new FundFundMe();
        fundFundMe.fundFundMe(address(fundMe));

        WithdrawFundMe withdrawFundMe = new WithdrawFundMe();
        withdrawFundMe.withdrawFundMe(address(fundMe));

        assertEq(address(fundMe).balance, 0);
    }
}
