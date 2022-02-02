//File Name: sysCrash.cpp
//
//This file spams Safari to cause RAM overflow
//
//Author: Mj Burog

#include <stdio.h>
#include <cstdlib>
#include <iostream>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>
using namespace std;

int main(){
    int x = 0;
    int y = 0;
    int z = 0;

    while(true){
        while (true){
            while (true){
                system("open -a Google\\ Chrome -n");
            }
            system("open -a iTunes -n");
        }
        system("open -a Safari -n");
    }
return 0;
}