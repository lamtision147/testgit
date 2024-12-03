// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./tabserc404.sol";  // Kế thừa từ hợp đồng ERC404 cơ sở

contract My404 is ERC404 {
    // Token ID counter
    uint256 private _tokenIdCounter;

    // Mappings for balance and ownership
    mapping(address => uint256) public balanceOf;
    mapping(uint256 => string) private _tokenURIs;
    mapping(uint256 => address) private _owners;

    // Constructor cho hợp đồng My404
    constructor(string memory _name, string memory _symbol) ERC404(_name, _symbol) {
        _tokenIdCounter = 0; // Khởi tạo counter của token
    }

    // Hàm mint token mới
    function mint(address to, string memory metadataURI) public {
        uint256 tokenId = _tokenIdCounter;
        _owners[tokenId] = to;
        balanceOf[to] += 1;
        _setTokenURI(tokenId, metadataURI);
        _tokenIdCounter++;
    }

    // Hàm set metadata URI cho một token
    function _setTokenURI(uint256 tokenId, string memory metadataURI) internal {
        _tokenURIs[tokenId] = metadataURI;
    }

    // Hàm lấy metadata URI cho một token
    function tokenURI(uint256 tokenId) public view returns (string memory) {
        return _tokenURIs[tokenId];
    }

    // Hàm chuyển nhượng token
    function transfer(address from, address to, uint256 tokenId) public {
        require(_owners[tokenId] == from, "ERC404: transfer of token that is not owned by sender");
        _owners[tokenId] = to;
        balanceOf[from] -= 1;
        balanceOf[to] += 1;
    }

    // Hàm lấy chủ sở hữu của token
    function ownerOf(uint256 tokenId) public view returns (address) {
        return _owners[tokenId];
    }
}
