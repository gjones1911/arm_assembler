//////////////////////////
//Gerald Jones cs 160
//Lab_8_9_2c
//////////////////////////
#include <cstdio>
using namespace std;


int main(void)
{
	int j,k;
   int *ptr=0;	
	
	j = 17;
	k = 26;
	ptr = &k;
	
	k= j + k;
	
	*ptr = -6;			//sets k to -6 using pointer dereferenceing
	
	k= j + *ptr;
	
	
	return 0;
	
}
