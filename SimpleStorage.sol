//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {

    //This meaning favoriteNumber = 0 (Same thing!)
    uint favoriteNumber;

    mapping(string => uint256) public searching;
    

    function store(uint _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

 //We can use these to inject the data inside our users of storage. Arrays! []

    People[] public peoplelist;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    //keywords that don't consume gas: viev, pure
    //view, just reads the state, doesn't update the blockchain thus no gas.
    //But, if these functions are inside a already gas consuming function, they affect gas.
    
    function retrive() public view returns (uint256){
        return favoriteNumber;
    }   

    //Under the "addPerson" function, with each added data, our peoplelist array and favorite number mapping is getting data as well!
    function addPerson(uint256  _favoriteNumber, string memory _name) public {
        peoplelist.push(People(_favoriteNumber, _name));
        searching[_name] = _favoriteNumber;

    }

}
