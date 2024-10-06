// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract GarageManager{
    struct Car {        
        string make;
        string model;
        string color;
        uint8 numberOfDoors;       
    }

    mapping (address => Car[]) public garage;

    error BadCarIndex(uint index);

    // Function to add a car to the user's collection in the garage
    function addCar(string calldata _make, string calldata _model, string calldata _color, uint8 _numberOfDoors) external {
        // Create a new car and push it to the user's garage
        Car memory newCar = Car({
            make: _make,
            model: _model,
            color: _color,
            numberOfDoors: _numberOfDoors
        });

        garage[msg.sender].push(newCar);
    }

    // Function to update a car's details for the calling user
    function updateCar(uint _index, string calldata _make, string calldata _model, string calldata _color, uint8 _numberOfDoors) external {
        // Check if the car exists for the calling user
        if (_index >= garage[msg.sender].length) {
            revert BadCarIndex(_index);
        }

        // Update the car at the given index
        Car storage carToUpdate = garage[msg.sender][_index];
        carToUpdate.make = _make;
        carToUpdate.model = _model;
        carToUpdate.color = _color;
        carToUpdate.numberOfDoors = _numberOfDoors;
    }

    /*function getUserCars(address _user) external view returns (Car[] memory) {
        return garage[_user];
    }*/

    function getMyCars() external view returns (Car[] memory) {
        return garage[msg.sender];
    }         

    function resetMyGarage() external {
        delete garage[msg.sender];
    }
}
