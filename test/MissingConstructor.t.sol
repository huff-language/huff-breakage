// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.15;

import "forge-std/Test.sol";
import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";
import {HuffConfig} from "foundry-huff/HuffConfig.sol";

contract MissingConstructorTest is Test {
  address mc;

  function setUp() public {
    // Deploy Missingconstructor
    mc = HuffDeployer.deploy("MissingConstructor");
  }

  /// @notice Call the contract, with any calldata
  function testcall(bytes memory call_data) public {
    (bool success, bytes memory res) = mc.call(call_data);
    assert(success == true);
    assertEq(res, abi.encode(address(this)));
  }
}
