// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Asset {
    string public state = 'onSale';

    // v1 --It is important to note that the contract also defines a "StateNotDefined" exception. This exception will be thrown if "newState" has a value that is neither 0 nor 1. Exceptions are used in Solidity to indicate that something unexpected has occurred during the execution of the contract.
    error StateNotDefined(uint unit);

    //The contract defines a function "changeState" that takes a parameter "newState" of type unsigned integer (uint). This function changes the state of the asset to "onSale" or "notForSale" depending on the value of "newState". If "newState" is 0, the state is set to "onSale". If "newState" is 1, the state is set to "notForSale". If "newState" has any other value, the "revert" function is executed and a "StateNotDefined" exception occurs.
    function changeState(uint newState) public {
        //v2 --
        require(newState == 0 || newState == 1, 'This state is not defined');
        
        if(newState == 0) {
            state = 'onSale';
        }else if(newState == 1){
            state = 'notForSale';
        }
        //v1 ---
        // } else {
        //     revert StateNotDefined(newState);
        // }
    }
}
