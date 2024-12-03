// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "./abERC404.sol";

/// @title Implementation of ERC404
/// @dev Implements the abstract ERC404 contract
contract ERC404Token is ERC404 {
    // Token metadata structure
    struct TokenData {
        address owner;
        string metadataURI;
    }

    // Mapping from tokenId to TokenData
    mapping(uint256 => TokenData) private _tokens;

    // Total number of tokens minted
    uint256 private _totalSupply;

    // Token name and symbol
    string public name = "TERC404";
    string public symbol = "T4";

    /// @notice Mints a new token to the specified address with metadata URI
    function mint(address to, string memory metadataURI) public override {
        require(to != address(0), "ERC404: Mint to zero address");

        uint256 tokenId = _totalSupply + 1; // Generate new token ID
        _tokens[tokenId] = TokenData({owner: to, metadataURI: metadataURI});
        _totalSupply++;

        emit TokenMinted(to, tokenId, metadataURI);
    }

    /// @notice Returns the metadata URI of a token
    function getMetadata(uint256 tokenId) public view override returns (string memory) {
        require(_tokens[tokenId].owner != address(0), "ERC404: Token does not exist");
        return _tokens[tokenId].metadataURI;
    }

    /// @notice Returns the owner of a token
    function getTokenOwner(uint256 tokenId) public view override returns (address) {
        require(_tokens[tokenId].owner != address(0), "ERC404: Token does not exist");
        return _tokens[tokenId].owner;
    }

    /// @notice Returns the total supply of tokens
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }
}
