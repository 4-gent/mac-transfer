#include <stdio.h>
int main(){
	int r,c;
	for(r=1; r<=3; r++){
		for(c=1; c<=3; c++){
			printf("%c", r+96);
		}
		printf("\n");
	}
	return 0;
}
