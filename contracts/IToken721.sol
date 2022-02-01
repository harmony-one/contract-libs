// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol";

interface IToken721 is IERC721Metadata, IERC721Enumerable {
    function initialize(address[] memory owners, uint[] memory tokenIds) external;
    function updateOwnership(address[] memory owners, uint[] memory tokenIds) external;
    function setBaseURI(string memory baseURI_) external;
}
