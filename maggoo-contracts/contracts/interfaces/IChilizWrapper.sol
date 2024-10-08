// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

interface IChilizWrapper {
    error WrappedTokenExists();
    error WrappedTokenDoesNotExist();
    error AlreadyExists();

    event WrappedTokenCreated(address indexed underlyingToken, address indexed wrappedToken);
    event MappingChanged(
        address underlyingToken,
        address wrappedToken,
        address newUnderlyingToken,
        address newWrappedToken
    );
    event Wrap(address account, address underlyingToken, uint256 amount, address wrappedToken, uint256 wrappedAmount);
    event Unwrap(address account, address wrappedToken, uint256 amount, uint256 unwrappedAmount);


    function underlyingToWrapped(address input) external view returns(address);
    function wrappedToUnderlying(address input) external view returns(address);

    function wrap(address account, address underlyingToken, uint256 amount) external returns (address wrappedToken);

    function unwrap(address account, address wrappedToken, uint256 amount) external;

    function createWrappedToken(address underlyingToken) external returns (address);

    function wrappedTokenFor(address underlyingToken) external view returns (address);

    function getUnderlyingToWrapped(address underlyingToken) external view returns (address);
}
