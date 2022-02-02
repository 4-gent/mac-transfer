#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

void main(void){
	double speed = 0;
	
	while(speed < 127){
		speed += 12.7;
		wait(1000);
	}
}
