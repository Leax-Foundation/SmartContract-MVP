pragma solidity ^0.4.24;

contract Storage {
    
    struct DataAdress{
        address walletAddressOld;
    }
    
    struct DataContract{
        string hashContractIPFS;
    }
    
    struct DataPic{
        string hashIPFS;
    }
    
    struct DataProperty{
        string country; 
        string state;
        string city;
        string addressProperty;
        mapping (uint256 => DataPic) image;
        mapping (uint256 => DataContract) contracts;
    }

    struct DataUser{
        string name;
        string addressUser;
        string profilePicIpfsHash;
        uint256 numProperty;
        uint256 numWalletAddress;
        address walletAddressActual;
        mapping (uint256 => DataProperty) property;
        mapping (uint256 => DataAdress) wallets;
    }
    
    mapping (uint256 => DataUser) internal _users;
    
    function _getUser(uint256 _userId) external view returns (string,string,string,address,uint256){
        return (
            _users[_userId].name, 
            _users[_userId].addressUser, 
            _users[_userId].profilePicIpfsHash, 
            _users[_userId].walletAddressActual,
            _users[_userId].numProperty);
    }
    
    function _getProperty(uint256 _userId, uint256 _propertyId) external view returns (string,string,string,string){
        return (
            _users[_userId].property[_propertyId].country, 
            _users[_userId].property[_propertyId].state, 
            _users[_userId].property[_propertyId].city, 
            _users[_userId].property[_propertyId].addressProperty);
    }
   
}