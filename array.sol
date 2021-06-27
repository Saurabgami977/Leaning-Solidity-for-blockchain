pragma solidity ^0.8.5;

contract Array {
    uint[] public ids;
    
    function addToArray (uint _id) public {
        ids.push(_id);
    }
    
    function readArray (uint _position) view public returns(uint){
        return ids[_position];
    }
    
    function readAll() view public returns(uint[] memory){
        return ids;
    }
    
    function readSize() view public returns(uint){
        return ids.length;
    }
    
}