// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";

contract Erc721 is ERC721, ERC721Pausable, Ownable, ERC721Burnable {
    uint256 private _nextTokenId;
    string private _contractURI;

    constructor(address initialOwner)
        ERC721("erc721", "E721")
        Ownable(initialOwner)
    {
        _contractURI = "https://metadata.boomland.io/contract-metadata"; // URL của contractURI, có thể cập nhật sau
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://metadata.boomland.io/h/1";
    }

    // Hàm để lấy contractURI
    function contractURI() public view returns (string memory) {
        return _contractURI;
    }

    // Hàm để cập nhật contractURI
    function setContractURI(string memory newContractURI) external onlyOwner {
        _contractURI = newContractURI;
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
    }

    // Hàm multiMint để mint nhiều NFT cùng lúc
    function multiMint(address to, uint256 count) public onlyOwner {
        require(count > 0, "Count must be greater than 0");
        for (uint256 i = 0; i < count; i++) {
            uint256 tokenId = _nextTokenId++;
            _safeMint(to, tokenId);
        }
    }

    // The following functions are overrides required by Solidity.

    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Pausable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }
}
