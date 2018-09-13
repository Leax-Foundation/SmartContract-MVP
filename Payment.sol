pragma solidity ^0.4.24;

import "./IERC20Basic.sol";
import "./Ownable.sol";

contract Payment is IERC20Basic, Ownable  {
        
    IERC20Basic tokenInterface;
    address public contractAddress;    
   
    function _setInterfaceContractAddress(address _address) external onlyOwner{
        tokenInterface = IERC20Basic(_address);
        contractAddress = _address;
    }  

    function _checkBalance(uint256 _balance) public view returns(bool){
        if(tokenInterface.balanceOf(msg.sender) >= _balance) return true;
        return false;
    } 
      
    function _pay (uint256 _value) internal returns (bool){
        uint256 balanceTokenUser;
        balanceTokenUser = tokenInterface.balanceOf(msg.sender);
        require(balanceTokenUser > _value,"saldo insuficiente");        
        tokenInterface.transfer(contractAddress,_value);
        emit Transfer(msg.sender, contractAddress,_value);
    }    
    
    function _getBalanceToken(address _addres) external view returns (uint256)
    {
        return tokenInterface.balanceOf(_addres);
    }    
    
    function _getContract() external view returns(address)
    {
        return tokenInterface;
    }
}