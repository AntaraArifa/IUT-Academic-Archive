#include <iostream>

using namespace std;

const int MAX = 100;
int memo[MAX];

int fib(int n) {
    if (n <= 1)
        return n;

    if (memo[n] == 0)
        memo[n] = fib(n - 1) + fib(n - 2);

    return memo[n];
}

int main() {
    int n;
    cout << "Enter the value of n: ";
    cin >> n;

    cout << "fibonacci(" << n << ") = " << fib(n) << endl;
    return 0;
}
