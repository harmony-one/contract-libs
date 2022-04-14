pragma solidity ^0.8.0;
import "./IdentityToken721.sol";

contract ITokenMutantApeYachtClub is IdentityToken721 {
    constructor() IdentityToken721("iToken MutantApeYachtClub", "iMAYC", "https://boredapeyachtclub.com/api/mutants/") {}
}
