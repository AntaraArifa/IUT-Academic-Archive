#include <stdio.h>

int add(int a, int b) {
    return a + b;
}

int isEven(int number) {
    if (number % 2 == 0) {
        return 1;
    } else {
        return 0;
    }
}

int main() {
    int x = 10;
    int y = 20;
    int result = add(x, y);

    if (isEven(result)) {
        printf("The result is even: %d\n", result);
    } else {
        printf("The result is odd: %d\n", result);
    }

    return 0;
}
