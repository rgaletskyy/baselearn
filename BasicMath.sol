// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract BasicMath {
    function adder(uint _a, uint _b) external pure returns (uint sum, bool error) {
        unchecked {
            
            sum = _a + _b;

            if (sum == 0 && (_a > 0 && _b > 0)) {
                return (0, true);
            }            

            if(sum > type(uint256).max){
                return (0, true);
            }

            return (sum, false);
        }
    }

    function subtractor (uint _a, uint _b) external pure returns (uint difference, bool error) {

        if(_a < _b){
            return (0, true);
        }

        difference = _a - _b;       
       
        return (difference, false);              
    }
}
