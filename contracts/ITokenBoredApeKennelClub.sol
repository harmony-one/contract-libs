pragma solidity ^0.8.0;
import "./IdentityToken721.sol";

contract ITokenBoredApeKennelClub is IdentityToken721 {
    constructor() IdentityToken721("iToken BoredApeKennelClub", "iBAKC", "ipfs://QmTDcCdt3yb6mZitzWBmQr65AW6Wska295Dg9nbEYpSUDR/") {}
}
