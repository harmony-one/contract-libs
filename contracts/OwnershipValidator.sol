// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./Token721.sol";

contract OwnershipValidator is Ownable {

    // eth ERC721 address => harmony Token721 address
    mapping(string => address) public _addrMap;

    function register(string memory ethAddress, Token721 oneAddress) public onlyOwner {
        require(Token721(address(0)) != oneAddress, "Invalid address");
        _addrMap[ethAddress] = address(oneAddress);
    }

    function unregister(string memory ethAddress) public onlyOwner {
        require(address(0) != address(_addrMap[ethAddress]), "the eth address has not been registered");
        delete _addrMap[ethAddress];
    }

    function updateOwnership(string memory ethAddress, address[] memory owners, uint[] memory tokenIds)
    external virtual onlyOwner {
        require(address(0) != address(_addrMap[ethAddress]), "the eth address has not been registered");
        return Token721(address(_addrMap[ethAddress])).updateOwnership(owners, tokenIds);
    }

    function balanceOf(string memory ethAddress, address owner) public view  returns (uint256) {
        require(address(0) != address(_addrMap[ethAddress]), "the eth address has not been registered");
        return Token721(address(_addrMap[ethAddress])).balanceOf(owner);
    }

    function ownerOf(string memory ethAddress, uint256 tokenId) public view returns (address) {
        require(address(0) != address(_addrMap[ethAddress]), "the eth address has not been registered");
        return Token721(address(_addrMap[ethAddress])).ownerOf(tokenId);
    }

    function name(string memory ethAddress) public view  returns (string memory) {
        require(address(0) != address(_addrMap[ethAddress]), "the eth address has not been registered");
        return Token721(address(_addrMap[ethAddress])).name();
    }

    function symbol(string memory ethAddress) public view returns (string memory) {
        require(address(0) != address(_addrMap[ethAddress]), "the eth address has not been registered");
        return Token721(address(_addrMap[ethAddress])).symbol();
    }

    function tokenURI(string memory ethAddress, uint256 tokenId) public view returns (string memory) {
        require(address(0) != address(_addrMap[ethAddress]), "the eth address has not been registered");
        return Token721(address(_addrMap[ethAddress])).tokenURI(tokenId);
    }
}
