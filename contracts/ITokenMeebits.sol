pragma solidity ^0.8.0;
import "./IdentityToken721.sol";

contract ITokenMeebits is IdentityToken721 {
    constructor() IdentityToken721("iToken Meebits", "iMeebit", "https://meebits.larvalabs.com/meebit/") {}
}
