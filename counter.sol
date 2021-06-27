pragma solidity ^0.6.0;

contract Counter {
    uint count;
    
    function getCount() view public returns(uint){
        return count;
    }
    
    function increase() public{
        count++;
    }  
    
    function decrease() public{
        count--;
    }
    
    function add(uint _num) public{
        count += _num;
    }
    
    function subtract(uint _num) public{
        count -= _num;
    }
}