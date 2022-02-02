#include <stdio.h>

int main(){
	int a = 5;
	int b = 2;
	int c = a*b;

	a = c*2;
	b = a/4;
	c = a-b;
	if((c - b) < a){
		a = 5;
		b = c;
	}
	else{
		a = 6;
		b = 0;
	}
	printf("%d\n", a);
	printf("%d\n", b);
}
