// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import {ERC1155} from "solmate/tokens/ERC1155.sol";

contract AdakaTix is ERC1155 {

    string public baseURI;

    constructor(string memory _baseURI){
        baseURI = _baseURI;
    }

    function uri(uint256 id) public view virtual override returns (string memory) {
        return string(abi.encodePacked(baseURI, id));
    }
}