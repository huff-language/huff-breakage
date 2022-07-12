<img align="right" width="150" height="150" top="100" src="./assets/breakage.png">

# huff-breakage • [![ci](https://github.com/huff-language/huff-breakage/actions/workflows/ci.yaml/badge.svg)](https://github.com/huff-language/huff-breakage/actions/workflows/ci.yaml) [![license](https://img.shields.io/badge/License-Apache_2.0-blue.svg?label=license)](https://opensource.org/licenses/Apache-2.0) ![solidity](https://img.shields.io/badge/solidity-%3E%3D%200.8.13-lightgrey)

A set of **Incorrect**, **Breaking**, and **Footgunned** [Huff](https://github.com/huff-language) Contracts.

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

_NOTE: Some of the below contracts compile correctly and have a `[COMPILES]` postfix_

```ml
src
├─ InvalidMacroInvocation — An invocation of a macro that doesn't exist
├─ InvalidMacroStatement — An invalid statement in a macro definition
├─ MissingConstantDef — A constant definition is missing
├─ MissingConstructor — A constructor macro definition is missing [COMPILES]
├─ TableBuiltins — Table Builtins created on deployment with missing label definitions
├─ UnmatchedJumpLabel — A jump label that has no matching label definition
```

## Explanations

_NOTE: Some of the below contracts compile correctly and thus have a `[COMPILES]` postfix_

<details>
<summary>Invalid Macro Invocation</summary>
<br />
On line 10 of <a href="./src/InvalidMacroInvocation.huff">InvalidMacroInvocation.huff</a>, we invoke a macro called <code>UNKNOWN</code>, but it doesn't exist in either the <code>InvalidMacroInvocation</code> Huff contract or any of its imports (there are none in this simple example).
<br />
Thus, the compiler will generate an error message like so when compiling the contract:
<p align="center">
<img height="300px" style="display: block; margin: 0 auto" src="./assets/invalidmacroinvocation.png">
</p>
</details>


<details>
<summary>Invalid Macro Statement</summary>
<br />
On line 11 of <a href="./src/InvalidMacroStatement.huff">InvalidMacroStatement.huff</a>, we make a call to the <code>FREE_STORAGE_POINTER()</code> keyword which is invalid within the context of a macro.
<br />
Thus, the compiler will generate an error message like so when compiling the contract:
<p align="center">
<img height="300px" style="display: block; margin: 0 auto" src="./assets/invalidmacrostatement.png">
</p>
</details>


<details>
<summary>Missing Constant Definition</summary>
<br />
On line 10 of <a href="./src/MissingConstantDef.huff">MissingConstantDef.huff</a>, the constant <code>[UNKNOWN_CONSTANT_DEFINITION]</code> is referenced (the brackets notate the item's location will be pushed to the stack) but there is no <code>UNKNOWN_CONSTANT_DEFINITION</code> definition present in the contract. This will generate an error message similar to below during compilation.
<p align="center">
<img height="300px" style="display: block; margin: 0 auto" src="./assets/missingconstantdef.png">
</p>
</details>


<details>
<summary>Missing Constructor [COMPILES]</summary>
<br />
Since missing constructors are allowed, the <a href="./src/MissingConstructor.huff">MissingConstructor.huff</a> contract will compile correctly, producing the below output:
<p align="center">
<img height="300px" style="display: block; margin: 0 auto" src="./assets/missingconstructor.png">
</p>
</details>


<details>
<summary>Table Builtins</summary>
<br />
On line 6 of <a href="./src/TableBuiltins.huff">TableBuiltins.huff</a>, the builting table contains references to labels that aren't defined, thus causing this contract to fail to compile.
<p align="center">
<img height="300px" style="display: block; margin: 0 auto" src="./assets/tablebuiltins.png">
</p>
</details>


<details>
<summary>Unmatched Jump Labels</summary>
<br />
On line 16 of <a href="./src/UnmatchedJumpLabel.huff">UnmatchedJumpLabel.huff</a>, the jump label <code>err</code> is referenced but there is no matching label definition. This will generate the following <code>Unmatched Jump Label</code> error:
<p align="center">
<img height="300px" style="display: block; margin: 0 auto" src="./assets/unmatchedjumplabels.png">
</p>
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
