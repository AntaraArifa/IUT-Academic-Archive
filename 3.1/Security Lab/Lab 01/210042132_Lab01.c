#include <stdio.h>
#include <string.h>


void AverageFinder(int array_v[], size_t size_)
{
    double sum_ = 0;
    for(int i=0;i < size_;++i)
    {
        array_v[i] = i;
        sum_ += array_v[i];
    }
    printf("%f \n",sum_);
    printf("%f \n",sum_/size_);
}

void remove_newline(char *str) {
    for (int i = 0; str[i] != '\0'; ++i) {
        if (str[i] == '\n') {
            str[i] = '\0';
            break;
        }
    }
}


void take_info()
{
    int age;
    char name[10];
    char address[10];
    char email[15];

    printf("Enter your name : ");
    fgets(name, sizeof(name), stdin);
    remove_newline(name);

    printf("\nEnter your age : ");
    scanf("%d",&age);
    getchar();

    printf("\nEnter your email : ");
    fgets(email, sizeof(email), stdin);
    remove_newline(email);

    printf("\nEnter your address : ");
    fgets(address, sizeof(address), stdin);
    remove_newline(address);

    printf("\n\nName : %s\n",name);
    printf("Age : %d\n",age);
    printf("Address : %s\n",address);
    printf("Email : %s\n",email);
}


void whats_wrong_1()
{
    char s[100];

    printf("Enter a name : ");
    fgets(s, sizeof(s), stdin);
    remove_newline(s);

    strcat(s, " is the best!!");


    printf("\n%s\n",s);

    printf("String size : %zu\n",strlen(s));
}


void whats_wrong_2()
{
    char s1[] = "Network";
    char s2[] = " Security";
    char s3[100] = "";

    strcat(s3,s1);
    strcat(s3,s2);

    printf("%s\n",s3);

    strncpy(s1,s3,sizeof(s1)-1);
    s1[sizeof(s1) - 1] = '\0';
    printf("%s",s1);
}




int main()
{
    //Task 0 Update the code so that your code follows
    //the first standard, We have discussed.
    int v[10];
    //Task 1 Update the code so that it calculates the
    //average of the 10 array elements
    AverageFinder(v, sizeof(v)/sizeof(v[0]));

    //Task 2 Update the code so that it scans and prints
    //all the information correctly
    take_info();

    //Task 3 Update the code so that correct string size
    //gets printed
    whats_wrong_1();

    //Task 4 Update the code so that unnecessary information
    //does not get printed
    whats_wrong_2();

    return 0;
}
