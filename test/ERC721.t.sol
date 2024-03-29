// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/ERC721.sol";

contract HelloWorldTest is Test {
    ERC721 erc721;
    address bob = address(0x1);
    address mary = address(0x2);

    function testMintToken() public {
        erc721 = new ERC721();
        erc721.mint(bob, 0);
        address ownerOf = erc721.ownerOf(0);
        assertEq(bob, ownerOf);
    }

    function testTransferToken() public {
        erc721 = new ERC721();
        erc721.mint(bob, 0);

        vm.startPrank(bob);
        erc721.safeTransferFrom(bob, mary, 0);
        address ownerOf = erc721.ownerOf(0);
        assertEq(mary, ownerOf);
    }

    function testGetBalance() public {
        erc721 = new ERC721();
        erc721.mint(bob, 0);
        erc721.mint(bob, 1);
        erc721.mint(bob, 2);
        erc721.mint(bob, 3);
        erc721.mint(bob, 4);

        uint256 balanceOf = erc721.balanceOf(bob);
        assertEq(balanceOf, 5);
    }

    function testOnlyOwnerBurn() public {
        erc721 = new ERC721();
        erc721.mint(bob, 0);
        vm.startPrank(mary);
        vm.expectRevert("not owner");
        erc721.burn(0);
    }
}
