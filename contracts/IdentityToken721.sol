// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IToken721.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract IdentityToken721 is ERC721, ERC721Enumerable, IToken721, Ownable {
    string public baseURI;

    constructor(string memory name_, string memory symbol_) ERC721(name_, symbol_) {}

    function initialize(address[] memory owners, uint[] memory tokenIds) external virtual override onlyOwner {
        require(owners.length != 0, "owners must be provided");
        require(owners.length == tokenIds.length, "data doesn't match");
        for (uint i = 0; i < owners.length; i++) {
            _mint(owners[i], tokenIds[i]);
        }
    }

    function updateOwnership(address[] memory owners, uint[] memory tokenIds) external virtual override onlyOwner {
        require(owners.length != 0, "owners must be provided");
        require(owners.length == tokenIds.length, "data doesn't match");
        for (uint i = 0; i < owners.length; i++) {
            require(_exists(tokenIds[i]), "tokenId doesn't exist");
            _transfer(ownerOf(tokenIds[i]), owners[i], tokenIds[i]);
        }
    }

    function setBaseURI(string memory baseURI_) public virtual override onlyOwner {
        baseURI = baseURI_;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
    }

    function approve(address to, uint256 tokenId) public virtual override(IERC721, ERC721) {
        revert('Unsupported operation');
    }

    function getApproved(uint256 tokenId) public view virtual override(IERC721, ERC721) returns (address) {
        revert('Unsupported operation');
    }

    function setApprovalForAll(address operator, bool approved) public virtual override(IERC721, ERC721) {
        revert('Unsupported operation');
    }

    function isApprovedForAll(address owner, address operator) public view virtual override(IERC721, ERC721) returns (bool) {
        revert('Unsupported operation');
    }

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override(IERC721, ERC721) {
        revert('Unsupported operation');
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override(IERC721, ERC721) {
        revert('Unsupported operation');
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) public virtual override(IERC721, ERC721) {
        revert('Unsupported operation');
    }

    function supportsInterface(bytes4 interfaceId) public view virtual
    override(IERC165, ERC721, ERC721Enumerable) returns (bool) {
        return interfaceId == type(IToken721).interfaceId || super.supportsInterface(interfaceId);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }
}
