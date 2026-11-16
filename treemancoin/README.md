# TreemanCoin (TREEMAN)

A fixed-supply ERC-20 token in a single file with no dependencies.

| Property | Value |
| --- | --- |
| Name | TreemanCoin |
| Symbol | TREEMAN |
| Decimals | 18 |
| Supply | 1,000,000 TREEMAN, minted once to the deploying wallet |

There is no owner, no minting after deployment, and no pause or blacklist.

## Deploy

1. Open <https://remix.ethereum.org> and paste in `TreemanCoin.sol`.
2. Compile with Solidity 0.8.20 or newer.
3. In "Deploy & Run", choose "Injected Provider" and connect your wallet.
4. Pick a network and press Deploy. Start with a test network such as Sepolia,
   where gas is paid with free test ETH.

The wallet that deploys receives the whole supply. Add the deployed contract
address to your wallet as a custom token to see the balance.

To change the name, symbol or supply, edit the constants at the top of the
contract before deploying; they cannot be changed afterwards.
