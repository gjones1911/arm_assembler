//code for lab 8-9 pt. 1

#include <cstdio>

int main(void)
{
	int x,y,gcd;
	x=267386880;
	y=4081;
	
	while (x!=y)
	{
		if(x<y)
		{
			y=y-x;			
		}
		else
		{
			x=x-y;	
		}		
	}	
	
	gcd=x;
	return 0;
}
