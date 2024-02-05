# Soulmate

# Disclaimer

_This code was created for Codehawks as the first flights for Valentin's day. It is made with bugs and flaws on purpose._
_Don't use any part of this code without reviewing it and audit it._

# About

Valentin's day is approaching, it is time to meet your soulmate and spread love (token) around the world !
For this you can mint your shared Soulbound NFT with an unknown person (your soulmate) and claim LoveToken each day.
A staking contract is available to collect more love. That's well known, if you give love, you receive more love.

## Soulmate.sol

The Soulbound NFT shared by soulmates used in the protocol.
It is used by Airdrop.sol and Staking.sol to know how long the couple are in love.

A couple can use this contract to let nice words to each other on the blockchain.

This contract overlook a sad possibility, but essential:
Sometimes, love can be hard, even if it is your soulmate... but there is always another solution : get divorced.
Warning, there is no way to cancel a divorce : no more LoveToken from Airdrop.sol for both of ex-lovers. That's an invariant.

## LoveToken.sol

## Airdrop.sol

Contract managing one vault dedicated to this contract.
The airdrop contract only contains the function `claim()` which distribute 1 LoveToken per day to every soulmates.
Both partner of a couple can claim their own token every days : financiary independency is important in a couple.

## Staking.sol

Contract managing one vault dedicated to this contract.
The staking contract permit to deposit, withdraw and claim staking rewards.
For every token deposit which stay during 1 week, 1 LoveToken is rewarded.

## Vault.sol

A simple contract which have two instances : A vault for the airdrop contract, and one for the staking contract.
Vault is just a simple contract keeping tokens and approving its manager (airdrop or staking contract) to shell out tokens according to their logics.

# Getting Started

## Requirements

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [foundry](https://getfoundry.sh/)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)`

# Usage

## Testing

```
forge test
```

### Test Coverage

```
forge coverage
```

and for coverage based testing:

```
forge coverage --report debug
```

# Audit Scope Details

- Commit Hash:
- In Scope:
  (For this contest, just use the main branch)

```
Hash:
```

## Compatibilities

- Solc Version: `0.8.23 < 0.9.0`
- Chain(s) to deploy contract to:
  - Ethereum

# Roles

None

# Known Issues

None
