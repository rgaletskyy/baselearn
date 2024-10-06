// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

// Importing the SillyStringUtils library
import "./SillyStringUtils.sol";

contract ImportsExercise {
    // Using the SillyStringUtils library for string manipulation
    using SillyStringUtils for string;

    // Declaring a public variable to store a Haiku
    SillyStringUtils.Haiku public haiku;

    function saveHaiku(string memory _line1, string memory _line2, string memory _line3) public {
        haiku.line1 = _line1;
        haiku.line2 = _line2;
        haiku.line3 = _line3;
    }
    
    function getHaiku() public view returns (SillyStringUtils.Haiku memory) {
        return haiku;
    }
    
    function shruggieHaiku() public view returns (SillyStringUtils.Haiku memory) {
        
        SillyStringUtils.Haiku memory newHaiku = haiku;
        
        newHaiku.line3 = newHaiku.line3.shruggie();
        return newHaiku;
    }
}
