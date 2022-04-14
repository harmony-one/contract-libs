pragma solidity ^0.8.0;
import "./IdentityToken721.sol";

contract ITokenDoodles is IdentityToken721 {
    constructor() IdentityToken721("iToken Doodles", "iDOODLE", "ipfs://QmPMc4tcBsMqLRuCQtPmPe84bpSjrC3Ky7t3JWuHXYB4aS/") {}
}
