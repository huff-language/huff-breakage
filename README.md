<img align="right" width="150" height="150" top="100" src="./assets/breakage.png">

# huff-breakage • [![ci](https://github.com/huff-language/huff-breakage/actions/workflows/ci.yaml/badge.svg)](https://github.com/huff-language/huff-breakage/actions/workflows/ci.yaml) [![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) ![Solidity](https://img.shields.io/badge/solidity-%3E%3D%200.8.13-lightgrey)

A set of **Incorrect**, **Breaking**, and **Footguned** [Huff](https://github.com/huff-language) Contracts.

## Overview

[huff-breakage](https://github.com/huff-language/huff-breakage) contains many contracts that demonstrate incorrect usage of the [Huff Language](https://huff.sh).

To reproduce contract errors, make sure `huffc` is installed by running:
```bash
curl -L get.huff.sh | bash
# `source ~/.bashrc` OR `source ~/.zshrc` OR `source ~/.profile`
huffup
```

Then, compile a given contract to view the error message. For example, to view an invalid macro invocation error, run `huffc -b ./src/InvalidMacroInvocation.huff`, which will produce output similar to:
```bash
Error: Missing Macro Definition For Invocation: "UNKNOWN"
-> src/InvalidMacroInvocation.huff:468-477
       |
  > 10 |     UNKNOWN()
       |
```


## Contracts

```ml
src
├─ InvalidMacroInvocation — An invocation to a macro that doesn't exist
```

## Examples

<details>
<summary>Invalid Macro Invocation</summary>

On line 10 of [InvalidMacroInvocation.huff](./src/InvalidMacroInvocation.huff), we invoke a macro called `UNKNOWN`, but it doesn't exist in either the `InvalidMacroInvocation` Huff contract or any of its imports (there are none in this simple example).

Thus, the compiler will generate an error message like so when compiling the contract:

<img src="./assets/invalidmacroinvocation.png">

</details>


## Safety Notice

This is **experimental software** and is provided on an "as is" and "as available" basis.

We **do not give any warranties** and **will not be liable for any loss** incurred through any use of this codebase.


## Installation

To install with [**Foundry**](https://github.com/foundry-rs/foundry):

```sh
forge install huff-language/huff-breakage
```

To install with [**Hardhat**](https://github.com/nomiclabs/hardhat) or [**Truffle**](https://github.com/trufflesuite/truffle):

```sh
npm install @huff-language/huff-breakage
```


## Acknowledgements

- [huff-rs](https://github.com/huff-language/huff-rs)
- [huffmate](https://github.com/huff-language) _SOON_
- [huff-examples](https://github.com/huff-language/huff-examples)
