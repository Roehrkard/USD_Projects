#include <stdio.h>
#include <string.h>
#include <stdlib.h>
char rotorone[26]={'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x', 'y','z'};//set rotor one
char rotortwo[26]={'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x', 'y','z'};//set rotor two

int size;
char rotorone_out[15];
char rotortwo_out[15];
int i,j;
int b=0;
char choice;
int a=0;
int r1;
void encrypt();
void decrypt();
void Rotor_One(int i, int a) ;
void Rotor_Two(int j,int a);
void Rotor_One_D(int i, int a) ;
void Rotor_Two_D(int j,int a);

int main(){

	for(;;){
	printf("menu\n");
	scanf("%c", &choice);
	if(choice=='e'){encrypt();}
	if(choice=='d'){decrypt();}
	if(choice=='q'){break;}
	}
}

//****************** encrypt function ********************************************************************************************************************/
void encrypt(){
		printf("entersize of message in chacters\t");
		scanf("%d",&size);
		int c = size;
		char message[size];
		printf("enter message to encript\t");
		scanf("%s",&message);
		printf("%s", message);
		printf("\n");
		for(a=0;a<=c;++a){
		printf("a=%d\tinput: %c\t",a, message[a]);
		i=message[a]-97;
		Rotor_One(i,a);
		printf("r1 :%c\t",rotorone_out[a]);
		j=rotorone_out[a]-97;
		Rotor_Two(j, a);
		printf("r2: %c\n", rotortwo_out[a]);
				}
		printf("\n\n");
		printf("the encrypted message is:\t%s", rotortwo_out);
		printf("\n\n");
		}
	

			
/*********************************************************************/
void Rotor_One(int i,int a){
	if(i<24){ rotorone_out[a]=rotorone[i+2];}
	

	if(i>=24){rotorone_out[a]=rotorone[-24+i];}
}
/******************************************/
void Rotor_Two(int j, int a){
	if(j<23-a){ rotortwo_out[a]=rotortwo[j+3+a];
	}

	if(j>=23-a){rotortwo_out[a]=rotortwo[-23+j+a];
	}
	
}
/***************************** decrypt function****************************************/
void decrypt(){
		printf("entersize of message in chacters\t");
		scanf("%d",&size);
		int c= size;
		char message[size];
		printf("enter message to encript\t");
		scanf("%s",&message);
		printf("%s", message);
		printf("\n");
		for(a=c;a>=0;--a){
		printf("a=%d\tinput: %c\t",a, message[a]);
		j=message[a]-97;
		Rotor_Two_D(j, a);
		printf("r2: %c\t", rotortwo_out[a]);
		i=rotortwo_out[a]-97;
		Rotor_One_D(i,a);
		printf("r1 :%c\n",rotorone_out[a]);

				}
		printf("\n\n");
		printf("the encrypted message is:\t%s", rotorone_out);
		printf("\n\n");

}
/*********************************************************************/
void Rotor_One_D(int i,int a){
	if(i<2){ rotorone_out[a]=rotorone[i+24];}
	

	if(i>=2){rotorone_out[a]=rotorone[i-2];}
}
/******************************************/
void Rotor_Two_D(int j, int a){
	if(j>3+a){ rotortwo_out[a]=rotortwo[j-3-a];
	}

	if(j<=3+a){rotortwo_out[a]=rotortwo[23+j-a];
	}
	
}


	
