// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.6;

/// @title Batch Caller
/// @author Chainvisions
/// @notice Contract for batch calling view functions.

contract BatchCaller {

    /// @notice Fetches uint256 values from contracts using a function signature.
    /// @param _addresses Addresses to fetch values from.
    /// @param _functionSig Function signature to call on the contracts.
    /// @return The values fetched
    function batchFetchUint256(
        address[] memory _addresses,
        string memory _functionSig
    ) external view returns (uint256[] memory) {
        uint256[] memory values = new uint256[](_addresses.length);
        for(uint256 i = 0; i < _addresses.length; i++) {
            (, bytes memory returnData) = _addresses[i].staticcall(abi.encodeWithSignature(_functionSig));
            uint256 value = abi.decode(returnData, (uint256));
            values[i] = value;
        }
        return values;
    }

    /// @notice Fetches address values from contracts using a function signature.
    /// @param _addresses Addresses to fetch values from.
    /// @param _functionSig Function signature to call on the contracts.
    /// @return The values fetched
    function batchFetchAddresses(
        address[] memory _addresses,
        string memory _functionSig
    ) external view returns (address[] memory) {
        address[] memory values = new address[](_addresses.length);
        for(uint256 i = 0; i < _addresses.length; i++) {
            (, bytes memory returnData) = _addresses[i].staticcall(abi.encodeWithSignature(_functionSig));
            address value = abi.decode(returnData, (address));
            values[i] = value;
        }
        return values;
    }
}