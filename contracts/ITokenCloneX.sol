pragma solidity ^0.8.0;
import "./IdentityToken721.sol";

contract ITokenCloneX is IdentityToken721 {
    constructor() IdentityToken721("iToken CloneX", "iCloneX", "https://clonex-assets.rtfkt.com/") {}
}
