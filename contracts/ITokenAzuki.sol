pragma solidity ^0.8.0;
import "./IdentityToken721.sol";

contract ITokenAzuki is IdentityToken721 {
    constructor() IdentityToken721("iToken Azuki", "iAZUKI", "https://ikzttp.mypinata.cloud/ipfs/QmQFkLSQysj94s5GvTHPyzTxrawwtjgiiYS2TBLgrvw8CW/") {}
}
