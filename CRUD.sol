pragma solidity ^0.8.5;

contract CRUD{
    struct User {
        uint id;
        string name;
        uint grade;
    }
    
    User[] public users;
    uint nextId = 1;
    
    function create(string memory _name, uint _grade) public {
        users.push(User(nextId, _name, _grade));
        nextId++;
    }
    
    function read(uint _id) view public returns(uint, string memory, uint){
        uint i = find(_id);
        return(users[i].id, users[i].name, users[i].grade);
            
        }
    
    
    function update(uint _id, string memory _name) public {
        uint i = find(_id);
        users[i].name = _name;
    }
    
    
    function destroy(uint _id) public {
        uint i = find(_id);
        delete users[i];
    }
    
    function find(uint _id) view internal returns(uint id){
        for(uint i=0; i<users.length; i++){
            if(users[i].id == _id){
                return i;
            }
        }
        revert('User doesn\'t exist');
    }
}



















