// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FavoriteRecords {

    mapping(string => bool) public approvedRecords;
    mapping(address => string[]) userFavorites;

    string [] recordsList = ["Thriller", "Back in Black", "The Bodyguard", "The Dark Side of the Moon",
    "Their Greatest Hits (1971-1975)", "Hotel California", "Come On Over", "Rumours", "Saturday Night Fever"];

    constructor() {
        for(uint8 i = 0; i < recordsList.length; i++) {
            approvedRecords[recordsList[i]] = true;
        }
    }

    function getApprovedRecords() public view returns (string [] memory list){
        list = recordsList;

        return list;
    }

    error NotApproved(string);
    function addRecord(string memory album) public  {
        if(approvedRecords[album]) {
            userFavorites[msg.sender].push(album);
        }
        else {
            revert NotApproved(album);
        }
    }

    function getUserFavorites(address addr) public view returns (string [] memory fav){
        fav = userFavorites[addr];
        return fav;
    }

    function resetUserFavorites() public {
        delete userFavorites[msg.sender];
    }
}
