#include <stdlib.h>
#include <iostream>
#include <stdio.h>
#include <math.h>

using namespace std;

/*double test(){
    printf("Lick my dick\n");
}*/

/*int main(){
    double x;
    x = test();
    x;
    return 0;
}*/
int main(){
    string x[5] = {"i", "like", "to", "eat", "bananas"};
    int y[5] = {1,2,3,4,5};
    //cout << x[0] << "\n";

    for (int i = 0; i < 3; i++){
            printf("%s\n", x[i].c_str());
            //cout << x <<"\n";
    }
    for (int i = 0; i < 5; i++){
            printf("%i\n", y[i]);
            //cout << x <<"\n";
    }
}