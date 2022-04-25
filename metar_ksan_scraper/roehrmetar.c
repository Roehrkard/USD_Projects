#include <stdio.h>
#include <stdlib.h>

#define elements 73

void DateTime(char data1[]);

void TempDew(char data1[]);

void WindSpeedDirection(char data1[]);

void SkyCondition(char data1[]);




int main()
{

	char METAR[elements];
	char num;
	int i;
	
	


	FILE *fptr;

	fptr=fopen("metarKSAN.txt","r");

	printf("The input METAR string is: \n");
	for (i=0;i<elements;++i)
	{
		fscanf(fptr,"%c",&METAR[i]);
		printf("%c",METAR[i]);
	}

	fclose(fptr);

	DateTime(METAR);

	TempDew(METAR);

	WindSpeedDirection(METAR);

	SkyCondition(METAR);

	printf("end program\n");
}

void DateTime(char data1[])
{

	printf("\n\nDay of the month: %c%c \n", data1[5],data1[6]);

	printf("\nTime is: %c%c:%c%c ZULU \n", data1[7],data1[8],data1[9],data1[10]);

}

void TempDew(char data1[])
{
	printf("\nTemperature is: %c%c Celsius\n", data1[51],data1[52]);

	printf("\nDew Point Temperature is: %c%c Celsius\n", data1[54],data1[55]);
}

void WindSpeedDirection(char data1[])
{
	printf("\nWind Speed is: %c%c Knots \n", data1[16],data1[17]);

	printf("\nWind Direction is: %c%c%c Degrees \n\n", data1[13],data1[14],data1[15]);
}

void SkyCondition(char data1[])
{
	char operator = data1[35];
	

		switch(operator)
		{
		//if plus
		case 'B':
		{
		
			printf("The sky condition is: Broken Clouds \n\n");
			printf("The clouds are: %c%c%c,000 feet high \n\n", data1[38],data1[39],data1[40]);

			break;
		}
		//if minus
		case 'F':
		{
			
			printf("The sky condition is: Few Clouds \n\n");
			printf("The clouds are: %c%c%c,000 feet high \n\n", data1[38],data1[39],data1[40]);

			break;
		}
		//if multiply
		case 'S':
		{
		
			printf("The sky condition is: Scattered Clouds \n");
			printf("The clouds are: %c%c%c,000 feet high \n", data1[38],data1[39],data1[40]);

			break;
		}
		//if divide
		case 'O':
		{
		
			printf("The sky condition is: Overcast \n\n");
			printf("The clouds are: %c%c%c,000 feet high \n\n", data1[38],data1[39],data1[40]);

			break;
		}
		//this will appear if operator isn't (+,-,*,/)
		default:
			printf("Error! SkyCondition is not correct \n\n");
		
	}
}	

