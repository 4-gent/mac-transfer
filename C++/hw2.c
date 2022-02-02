#include <stdio.h>

int main(){
	int a = 1;
	int count = 0;
	
	while(count < 4){
	 	if(count < 2){
			a+=4;
		}
		else{
			a +=count;
		}
		count +=1;
	}
	printf("%d\n", a);
}
