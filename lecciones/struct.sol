// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract HeroStruct {
    struct Hero {
        string name;
        uint age;
        string power;
        string team;
    } 

    Hero batman = Hero("Batman", 30, "dinero", "liga de la justicia");
}