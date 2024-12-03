// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

/// @title ERC404 - Abstract Contract for Unique Tokens
/// @dev This abstract contract defines the core interface for ERC404 tokens.
abstract contract ERC404 {
    // Event emitted when a new token is minted
    event TokenMinted(address indexed to, uint256 indexed tokenId, string metadataURI);

    /// @notice Mints a new token to the specified address with metadata URI
    /// @param to Address to mint the token to
    /// @param metadataURI URI pointing to the token's metadata
    function mint(address to, string memory metadataURI) public virtual;

    /// @notice Returns the metadata URI of a token
    /// @param tokenId Token ID to query
    /// @return Metadata URI of the token
    function getMetadata(uint256 tokenId) public view virtual returns (string memory);

    /// @notice Returns the owner of a token
    /// @param tokenId Token ID to query
    /// @return Address of the token owner
    function getTokenOwner(uint256 tokenId) public view virtual returns (address);

    /// @notice Returns the total supply of tokens
    /// @return Total number of tokens
    function totalSupply() public view virtual returns (uint256);
}
