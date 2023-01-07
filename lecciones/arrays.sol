// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;


contract ArraysSol {
    //fixed length
    uint[3] steps = [1,2,3];
    //dynamic length
    uint[] nombreArray;

    function pushArray() public {
        nombreArray.push(2); //[2]
        nombreArray.push(4); //[2,4]
        nombreArray.pop(); //[2]
        nombreArray[0]; //[2]
    }

}