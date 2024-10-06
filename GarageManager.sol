// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract GarageManager{
    struct Car {
        string make;
        string model;
        string color;
        uint8 numberOfDoors;
    }

    mapping (address => Car[]) public garage;

    function addCar(string calldata _make, string calldata _model, string calldata _color, uint8 _numberOfDoors) public {
        
        Car memory newCar = Car(
            {
                make: _make,
                model: _model,
                color: _color,
                numberOfDoors: _numberOfDoors
            }
        );       

        garage[msg.sender].push(newCar);
    }

    function getMyCars() public view returns (Car[] memory myCars) {
        myCars = garage[msg.sender];

        return myCars;
    }

    function getUserCars(address userAddress) public view returns (Car[] memory userCars) {
        userCars = garage[userAddress];

        return userCars;
    }

    error BadCarIndex(uint index);
    function updateCar(uint index, uint8 _numberOfDoors, string memory _make, string memory _model, string memory _color) public {
        Car[] memory myCars = garage[msg.sender];

        if(myCars.length < index) {
            revert BadCarIndex(index);
        }

        Car memory carToUpdate = myCars[index];
        carToUpdate.make = _make;
        carToUpdate.model = _model;
        carToUpdate.color = _color;
        carToUpdate.numberOfDoors = _numberOfDoors;
    }

    function resetMyGarage() public {
        delete garage[msg.sender];
    }

}
