// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./IToken721.sol";

contract OwnershipValidator is Ownable {

    // ERC721 contract address on other chain (e.g. ETH) => harmony IToken721 address
    mapping(string => address) public addrMap;
    // current version (block number) to which the ERC721 contract has been updated
    mapping(string => uint) public versions;

    function register(string memory ethAddress, IToken721 oneAddress) public onlyOwner {
        require(IToken721(address(0)) != oneAddress, "Invalid address");
        addrMap[ethAddress] = address(oneAddress);
    }

    function unregister(string memory ethAddress) public onlyOwner {
        require(address(0) != address(addrMap[ethAddress]), "the eth address has not been registered");
        delete addrMap[ethAddress];
        delete versions[ethAddress];
    }

    function initialize(string memory ethAddress, address[] memory owners, uint[] memory tokenIds, uint version)
    external virtual onlyOwner {
        require(address(0) != address(addrMap[ethAddress]), "the eth address has not been registered");
        versions[ethAddress] = version;
        return IToken721(address(addrMap[ethAddress])).initialize(owners, tokenIds);
    }

    function updateOwnership(string memory ethAddress, address[] memory owners, uint[] memory tokenIds,
        uint version)
    external virtual onlyOwner {
        require(address(0) != address(addrMap[ethAddress]), "the eth address has not been registered");
        require(versions[ethAddress] < version, "updating version is less than current version");
        versions[ethAddress] = version;
        return IToken721(address(addrMap[ethAddress])).updateOwnership(owners, tokenIds);
    }

    function setBaseURI(string memory ethAddress, string memory baseURI_) external virtual onlyOwner {
        require(address(0) != address(addrMap[ethAddress]), "the eth address has not been registered");
        return IToken721(address(addrMap[ethAddress])).setBaseURI(baseURI_);
    }
    
    function balanceOf(string memory ethAddress, address owner) public view  returns (uint256) {
        require(address(0) != address(addrMap[ethAddress]), "the eth address has not been registered");
        return IToken721(address(addrMap[ethAddress])).balanceOf(owner);
    }

    function ownerOf(string memory ethAddress, uint256 tokenId) public view returns (address) {
        require(address(0) != address(addrMap[ethAddress]), "the eth address has not been registered");
        return IToken721(address(addrMap[ethAddress])).ownerOf(tokenId);
    }

    function name(string memory ethAddress) public view  returns (string memory) {
        require(address(0) != address(addrMap[ethAddress]), "the eth address has not been registered");
        return IToken721(address(addrMap[ethAddress])).name();
    }

    function symbol(string memory ethAddress) public view returns (string memory) {
        require(address(0) != address(addrMap[ethAddress]), "the eth address has not been registered");
        return IToken721(address(addrMap[ethAddress])).symbol();
    }

    function tokenURI(string memory ethAddress, uint256 tokenId) public view returns (string memory) {
        require(address(0) != address(addrMap[ethAddress]), "the eth address has not been registered");
        return IToken721(address(addrMap[ethAddress])).tokenURI(tokenId);
    }
}
