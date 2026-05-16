// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SoulboundVisitCardERC721 is ERC721URIStorage, Ownable {
    uint256 private _nextTokenId;

    constructor() ERC721("StudentVisitCard", "SVC") Ownable(msg.sender) {}

    // Минт доступен только владельцу контракта
    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // Блокируем любые трансферы (Soulbound логика)
    function _update(address to, uint256 tokenId, address auth) internal override returns (address) {
        address from = _ownerOf(tokenId);
        // Разрешаем только минт (когда from == адрес 0)
        require(from == address(0) || to == address(0), "Soulbound: Transfer not allowed");
        return super._update(to, tokenId, auth);
    }

    // Блокируем аппрувы (убрали имена переменных и добавили pure)
    function approve(address, uint256) public pure override(ERC721, IERC721) {
        revert("Soulbound: Approval not allowed");
    }

    function setApprovalForAll(address, bool) public pure override(ERC721, IERC721) {
        revert("Soulbound: Approval not allowed");
    }
}