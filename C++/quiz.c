#include <stdio.h>

int main(){
	int x=0;
	int y=15;
	while(y>4){
		y=y-3;
		x=x+y;
	}
	printf("%d\n", x);
	//printf("%d\n", y);
}
