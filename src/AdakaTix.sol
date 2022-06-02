// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import {ERC1155} from "solmate/tokens/ERC1155.sol";

contract AdakaTix is ERC1155 {
    string public name;
    string public symbol;

    string public baseURI;
    uint256[2] public totalSupply;
    uint256[2] public maxSupply = [1000, 8000];
    uint256[2] public price = [0.1 ether, 0.02 ether];
    uint256 maxMintAmount = 20;
    mapping(address => uint256) public membershipsMinted;

    constructor(string memory _name, string memory _symbol, string memory _baseURI){
        name = _name;
        symbol = _symbol;
        baseURI = _baseURI;
    }

    function uri(uint256 id) public view virtual override returns (string memory) {
        return string(abi.encodePacked(baseURI, id));
    }

    function mint(uint256 id, uint256 amount) public payable {
        require(totalSupply[id] + amount <= maxSupply[id], "Over max supply");
        require(msg.value == amount * price[id], "Value doesn't match price");
        require(amount < maxMintAmount, "Can't mint that many");

        if (id == 0){
            require(membershipsMinted[msg.sender] + amount <= 2);
            membershipsMinted[msg.sender] += amount;
        }

        totalSupply[id] += amount;
        _mint(msg.sender, id, amount, "");
    }

}