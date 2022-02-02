//File Name: linStartup.cpp
//
//This file will be in a repository to be and
//it will run to make ubuntu setup the way
//I want it to setup
//
//Author: Mj Burog
//

#include <stdio.h> //standard library input/output etc
#include <stdlib.h> //same thing as cstdlib
#include <fcntl.h> //file control library
#include <sys/stat.h> //library for getting file attributes
#include <iostream> //stream and input/output library
#include <unistd.h> //for misc symbols and constant types like null
#include <string.h> //basic strings
#include <thread> //class to represent individual threads of execution
#include <chrono> //date and time library
#include <cstdlib> //random numbers, general stuff
#include <ctime> //c-style time utilities
using namespace std; //Getline namespace

void pkg();
//-------------------------------------
//Developer pkg installs
void pkg(){
    printf("Installing Packages...");
    system("sudo apt-get install gufw -y");
}
//-------------------------------------
//Initialization
int main(){
    //pkg install for this shit
    pkg();
    
}
