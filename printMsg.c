
#include "stm32f4xx.h"
#include <string.h>
#include<stdio.h>
void printMsg(int a,int b)
{
		float a1=*((float*) &a) ;
		float b1=*((float*) &b) ;
		//float d1=*((float*) &d) ;
	char Msg1[10];
	char Msg2[10];
	//char Msg3[10];
	//char Msg4[10];
	 char *ptr;
	 sprintf(Msg1, "%f", a1);
		sprintf(Msg2, "%f", b1);
		//sprintf(Msg3,"%d",c);
	//sprintf(Msg4,"%f",d1);
	 //ptr = Msg4 ;
   //while(*ptr != '\0'){
   //   ITM_SendChar(*ptr);
    //  ++ptr;
   //} 
	 //ITM_SendChar(',');
	// ptr=Msg3 ;
	  //while(*ptr != '\0'){
     // ITM_SendChar(*ptr);
      //++ptr;
   //}
		//ITM_SendChar(',');
		ptr=Msg2 ;
	  while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   }
		ITM_SendChar(',');
		ptr=Msg1 ;
	  while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   }
		ITM_SendChar('\n');	
}
void printMsg2p(const int a,const int b)
{
	 char Msg[100];
	 char *ptr;
ITM_SendChar('\n');
	 ITM_SendChar('X');
	 ITM_SendChar('0');
	ITM_SendChar('	');
	ITM_SendChar('X');
	ITM_SendChar('1');
	ITM_SendChar('	');
	ITM_SendChar('X');
	ITM_SendChar('2');
	ITM_SendChar('	');
	ITM_SendChar('Y');
	ITM_SendChar('\n');
	 // Printing the message
	ITM_SendChar('1');
	ITM_SendChar('	');
	ITM_SendChar('0');
	ITM_SendChar('	');
	ITM_SendChar('0');
	ITM_SendChar('	');
	 //Printing the first parameter
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar('\n');
	 ITM_SendChar('1');
	ITM_SendChar('	');
	ITM_SendChar('0');
	 ITM_SendChar('	');
	ITM_SendChar('1');
	ITM_SendChar('	');
	 
	 sprintf(Msg, "%x", b);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar('\n');
	
}
void printMsghead(const int a)
{
	 char Msg[100];
	 ITM_SendChar('X');
	 ITM_SendChar('0');
	ITM_SendChar('	');
	ITM_SendChar('X');
	ITM_SendChar('1');
	ITM_SendChar('	');
	ITM_SendChar('X');
	ITM_SendChar('2');
	ITM_SendChar('	');
	ITM_SendChar('Y');
	 sprintf(Msg, "%x", a);
   //while(*ptr != '\0')
	 //{
   //   ITM_SendChar(*ptr);
   //   ++ptr;
   //}
	
}
void printMsg4p(const int a, const int b, const int c, const int d)
{
	 char Msg[100];
	 char *ptr;
	ITM_SendChar('\n');
	 ITM_SendChar('X');
	 ITM_SendChar('0');
	ITM_SendChar('	');
	ITM_SendChar('X');
	ITM_SendChar('1');
	ITM_SendChar('	');
	ITM_SendChar('X');
	ITM_SendChar('2');
	ITM_SendChar('	');
	ITM_SendChar('Y');
	ITM_SendChar('\n');
	 // Printing the message
	ITM_SendChar('1');
	ITM_SendChar('	');
	ITM_SendChar('0');
	ITM_SendChar('	');
	ITM_SendChar('0');
	ITM_SendChar('	');
	 //Printing the first parameter
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar('\n');
	 ITM_SendChar('1');
	ITM_SendChar('	');
	ITM_SendChar('0');
	 ITM_SendChar('	');
	ITM_SendChar('1');
	ITM_SendChar('	');
	 
	 sprintf(Msg, "%x", b);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar('\n');
	 // Printing the message
	ITM_SendChar('1');
	ITM_SendChar('	');
	ITM_SendChar('1');
	ITM_SendChar('	');
	ITM_SendChar('0');
	ITM_SendChar('	');
	 sprintf(Msg, "%x", c);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar('\n');
	 // Printing the message
	ITM_SendChar('1');
	ITM_SendChar('	');
	ITM_SendChar('1');
	ITM_SendChar('	');
	ITM_SendChar('1');
	ITM_SendChar('	');
	 sprintf(Msg, "%x", d);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
	 }
}


