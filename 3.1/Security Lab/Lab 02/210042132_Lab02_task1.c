#include <stdio.h>

int main()
{
    char *ptrName;
    char fullName[] = "ANTARA ARIFA MULLICK";
    ptrName= fullName;
    printf("My name is %s\n",ptrName);

    int *ptrSalary = (int*)malloc(sizeof(int));
    *ptrSalary = 1000;
    printf("My salary is %d\n",*ptrSalary);

    free(ptrSalary);
    *ptrSalary=NULL;
    *ptrSalary = 2000;
    printf("After promotion my salary will be %d\n",*ptrSalary);

    char* alphabet = (char*) malloc(27);
    for(int i=0; i<26; i++)alphabet[i] = i+'A';
    alphabet[26] = '\0';

    printf("%s\n",alphabet);

    char* revAlphabet = (char*) malloc(27);
    for(int i=0; i<26; i++)revAlphabet[i] = 'Z'-i;
    revAlphabet[26] = '\0';
    //You need to print A-Z

    printf("%s\n",revAlphabet);

    return 0;
}
