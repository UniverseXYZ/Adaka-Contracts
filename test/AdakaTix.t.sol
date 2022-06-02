// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import {DSTestPlus} from "solmate/test/utils/DSTestPlus.sol";

import {AdakaTix} from "../src/AdakaTix.sol";

contract AdakaTixTest is DSTestPlus {
    AdakaTix adakaTix;

    function setUp() public {
        adakaTix = new AdakaTix("Adaka Tix", "TIX", "");
    }

    function testMintMembership() public {}

    function testMintTickets() public {}
}
