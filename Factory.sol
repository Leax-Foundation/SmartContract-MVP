pragma solidity ^0.4.24;

import "./AutoIncrementing.sol";
import "./Storage.sol";

contract Factory is Storage {

    using AutoIncrementing for AutoIncrementing.CounterUser;  
    using AutoIncrementing for AutoIncrementing.CounterProperty;  
    using AutoIncrementing for AutoIncrementing.CounterContract;  
    
    uint256 internal IdUser;
    uint256 internal IdProperty;
    uint256 internal IdContract;
    
    mapping(uint256 => AutoIncrementing.CounterUser) internal _countersUser;
    mapping(uint256 => AutoIncrementing.CounterProperty) internal _countersProperty;
    mapping(uint256 => AutoIncrementing.CounterContract) internal _countersContract;
    
    
    function _setNewUser(
        string _name, 
        string _addressUser, 
        string _profilePicIpfsHash,
        address _walletAddressActual)
        external 
        returns (uint256) {
          IdUser = _countersUser[1].nextIdUser(); 
            _users[IdUser].name = _name;
            _users[IdUser].addressUser = _addressUser;
            _users[IdUser].profilePicIpfsHash = _profilePicIpfsHash;
            _users[IdUser].walletAddressActual = _walletAddressActual;
            _users[IdUser].numProperty = 0;
            _users[IdUser].numWalletAddress = 1;
            return IdUser;
        }
    
    function _setNewProperty(
        uint256 _idUser,
        string _country,
        string _state,
        string _city,
        string _addressProperty,
        string _imgHashIPFS)
        external
        returns(uint256){
            IdProperty = _countersProperty[1].nextIdProperty(); 
            _users[_idUser].property[IdProperty].country = _country;
            _users[_idUser].property[IdProperty].state = _state;
            _users[_idUser].property[IdProperty].city = _city;
            _users[_idUser].property[IdProperty].addressProperty = _addressProperty;
            _users[_idUser].property[IdProperty].image[0].hashIPFS = _imgHashIPFS;
        }
        
    function _setNewContractProperty(
        uint256 _idUser, 
        uint256 _idProperty, 
        string _hashContractIPFS)
        external
        returns (uint256){
            IdContract = _countersContract[1].nextIdContract();
            _users[_idUser].property[_idProperty].contracts[IdContract].hashContractIPFS = _hashContractIPFS;
        }
    
    function _setAlterAddressWalletUser(uint256 _idUser, address _newAddress) external returns(bool) {
        uint256 idWallet = _users[_idUser].numWalletAddress++;
        _users[_idUser].numWalletAddress = idWallet;
        _users[_idUser].wallets[idWallet].walletAddressOld = _users[_idUser].walletAddressActual;
        _users[_idUser].walletAddressActual = _newAddress;
         
    }
    

}

         