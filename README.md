# Solidity Crash Course – Contracts

This repo contains all smart contracts used in the 7-Day Solidity Crash Course.

## Structure

- Day1_HelloWorld.sol – Basic Solidity file, constructor, state variable
- Day2_DataStructures.sol – storage vs memory, structs, mappings, events, modifiers
- Day3_SimpleWallet.sol – deposit, withdraw, events, ETH flow
- Day4_ReentrancyDemo.sol – vulnerable + safe vault, nonReentrant pattern
- Day5_MyToken.sol – ERC20 token using OpenZeppelin
- Day5_MyNFT.sol – ERC721 NFT using OpenZeppelin

## Usage

```bash
npm install
npx hardhat compile
npx hardhat node
npx hardhat run scripts/deploy.js --network localhost
```
