// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VuA8721 is ERC721, ERC721Burnable, Ownable {
    uint256 private _nextTokenId;
    string private _contractURI;
    string private _baseTokenURI;

    constructor(address initialOwner, string memory contractMetaURI, string memory initialBaseURI)
        ERC721("vu A8 721", "va81")
        Ownable(initialOwner)
    {
        _contractURI = contractMetaURI;
        _baseTokenURI = initialBaseURI;
    }

    // Function to get contract-level metadata
    function contractURI() public view returns (string memory) {
        return _contractURI;
    }

    // Function to update contract-level metadata URI
    function setContractURI(string memory newContractURI) public onlyOwner {
        _contractURI = newContractURI;
    }

    // Overriding the baseURI function for token metadata
    function _baseURI() internal view override returns (string memory) {
        return _baseTokenURI;
    }

    // Function to update the base token metadata URI
    function setBaseURI(string memory newBaseURI) public onlyOwner {
        _baseTokenURI = newBaseURI;
    }

    // Function to safely mint one NFT
    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
    }

    // Function to mint multiple NFTs at once
    function multiMint(address to, uint256 quantity) public onlyOwner {
        require(quantity > 0, "Quantity must be greater than zero");
        for (uint256 i = 0; i < quantity; i++) {
            uint256 tokenId = _nextTokenId++;
            _safeMint(to, tokenId);
        }
    }
}
