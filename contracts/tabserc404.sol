// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

abstract contract ERC404 {
    string public name;
    string public symbol;

    // Constructor cho hợp đồng ERC404 cơ sở
    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
    }
}
