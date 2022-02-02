//File Name: teabag.cpp
//
//Script that runs macOS system wide edits for the Green Tea GUI
//
//Author: Marlon Burog

//-----------------------------------------------
//Libraries
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
//-----------------------------------------------
void devTools();
//-------------------------------------
//Dev Tool Installation
void devTools(){
    //Homebrew Install
    printf("Installing HomeBrew\n");
    std::string brew("/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)\"");
    system(("" +brew).c_str());
    printf("Homebrew Installed\n");

    //C Compiler Install
    printf("C Compiler Install...\n");
    system("gcc");
    printf("C Compiler Installed...\n");

    //C++ Compiler Install
    printf("C++ Compiler Install...\n");
    system("g++");
    printf("C++ Compiler Installed...\n");

    //Python Install
    printf("Python Install...\n");
    system("brew install python3");
    printf("Python Installed...\n");

    //Python pkg Install
    printf("Python pkg Installation...\n");
    system("pip3 install pillow");
    system("pip3 install requests");
    system("pip3 install pylint");
    printf("Python pkg Installed\n");

    //gcc@8 Install
    printf("Installing Recent Version of gcc...\n");
    printf("brew install gcc@8");
    printf("gcc@8 Installed\n");

    //Visual Studio Code Install
    printf("Installing Visual Studio Code\n");
    system("brew cask install visual-studio-code");
    printf("Visual Studio Code Installed\n");

    //Visual Studio Install
    printf("Installing Visual Studio\n");
    system("brew cask install visual-studio");
    printf("Visual Studio Installed\n");

}
//-------------------------------------