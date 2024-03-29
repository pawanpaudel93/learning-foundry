// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/HelloWorld.sol";

contract HelloWorldTest is Test {
    HelloWorld hello;

    function setUp() public {
        hello = new HelloWorld("Foundry is fast");
    }

    function test1() public {
        assertEq(hello.greet(), "Foundry is fast");
    }

    function test2(string memory _greeting) public {
        assertEq(hello.version(), 0);
        hello.updateGreeting(_greeting);
        assertEq(hello.version(), 1);
        emit log_named_string("Greeting is: ", _greeting);
        assertEq(hello.greet(), _greeting);
    }
}
