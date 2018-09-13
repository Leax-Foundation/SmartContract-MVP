pragma solidity ^0.4.24;

contract IERC20Basic {
    uint256 public totalSupply;
    function balanceOf(address who) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
    event Transfer (address indexed from, address indexed to, uint256 value);
}