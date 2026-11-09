#include <iostream>
#include <stack>
#include <string>

using namespace std;


string removeAdjacentDuplicates(string s) {
    stack<char> stk;

    for (char c : s) {
        if (!stk.empty() && stk.top() == c) {
            stk.pop();
        } else {
            stk.push(c);
        }
    }

    string result = "";
    while (!stk.empty()) {
        result = stk.top() + result;
        stk.pop();
    }

    return result;
}

int main() {
    int N;
    cin >> N;

    cin.ignore();

    for (int i = 0; i < N; i++) {
        string s;
        getline(cin, s);
        string modified = removeAdjacentDuplicates(s);
        cout << "[" << modified << "]" << endl;
    }

    return 0;
}

