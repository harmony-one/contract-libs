// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol";

interface IToken721 is IERC721Metadata, IERC721Enumerable {
    function updateOwnership(address[] memory owners, uint[] memory tokenIds) external;
}
