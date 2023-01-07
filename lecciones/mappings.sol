// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;


contract ArraysSol {
    //This line of code in Solidity defines a mapping (essentially a hash table or dictionary) called "countries" that maps from string keys to string values.
    mapping (string => string ) countries;

    function pushMapping() public {
        countries["USA"] = "United States of America";
        countries["FRA"] = "France";
        countries["CHN"] = "China";

    }
    // retrieve a value from the mapping using its key
    string country = countries["FRA"];  // this will assign "France" to the variable "country"

}