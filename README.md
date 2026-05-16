# Crypto & Blockchain Assignment: NFT Contracts

## Deployed Contracts (Sepolia Testnet)
* **Soulbound Visit Card (ERC-721):** https://sepolia.etherscan.io/tx/0xe8d0dd823f974ea8d209efc9be7a77fd85e61eb1364c663648063555652092e3
* **Game Character Collection (ERC-1155):** https://sepolia.etherscan.io/tx/0x7149334cde0087a560e1a31182b34b0a7a668e1feae73717a5b39ea41bcc638b

## Technical Setup & Deployment
1. Contracts were written and deployed using **Remix IDE**.
2. Compiled with Solidity version `0.8.20` using **OpenZeppelin 5.0** audited libraries.
3. Environment used: Injected Provider (MetaMask connected to **Sepolia Testnet**).

## Metadata Structure & Storage
All metadata is stored off-chain via IPFS (Pinata).
* **ERC-721:** Points to a single JSON containing `name`, `image`, and attributes (`studentID`, `course`).
* **ERC-1155:** Uses a base URI pointing to an IPFS folder (`ipfs://bafybeiftblgunztyzetvus3zqthxycxwetnkpal6hug6lt4rrnmh6gqh7m/`). The `uri` function is overridden to append `{id}.json` to the token ID to comply with OpenSea metadata standards.

## How to Mint & Test
* **Soulbound ERC-721:** The contract owner calls the `safeMint(address to, string uri)` function. Transfers are blocked by overriding the `_update` function from OpenZeppelin, ensuring the token is locked to the receiver's wallet (Soulbound behavior). Approvals are also disabled.
* **ERC-1155 Game Characters:** The contract owner calls `mintBatch(address to, uint256[] ids, uint256[] amounts, bytes data)` to mint multiple character IDs at once. Normal transfer and approval functionalities are retained.

## Proof of Functionality (Transaction Hashes)
* **ERC-721 Mint Transaction:** https://sepolia.etherscan.io/tx/0x38a7a761f9892286f7af51d4864d0a836f1c68d80b8828897eed93dc460d9274
* **ERC-1155 Batch Mint Transaction:** https://sepolia.etherscan.io/tx/0x983c4872c0d340f08030ddca2fc80224ddc4c2231d3bb6ac5c04d97c298c8ef5

<img width="1828" height="693" alt="Снимок экрана 2026-05-17 001836" src="https://github.com/user-attachments/assets/aa1de8e6-493e-48c5-ba68-1269d7b68087" />
