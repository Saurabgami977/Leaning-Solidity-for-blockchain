pragma solidity ^0.6.0;

contract HotelRoom {
    // Ether - pay smart contract
    // Modifiers
    // Eventes
    // Enums
    
    //vaccant or occupied
    enum Statuses { Vaccant, Occupied }
    Statuses currentStatus;
    
    event Occupy(address _occupants, uint _amount);
    
    address payable public owner;
    
    constructor() public{
        owner = msg.sender;
        currentStatus = Statuses.Vaccant;
    }
    
    modifier isVaccant{
        //Check room status
        require(currentStatus == Statuses.Vaccant, "Already Occupied");
        _;
    }
    
    modifier isEnoughAmount(uint _amount){
        //Check Price
        require(msg.value >= _amount, "Not enough Ether Provided, Should be 2 Ether");
        _;
    }
    
    receive() external payable isVaccant isEnoughAmount(2 ether){
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value);
        emit Occupy(msg.sender, msg.value);
    }
    
}