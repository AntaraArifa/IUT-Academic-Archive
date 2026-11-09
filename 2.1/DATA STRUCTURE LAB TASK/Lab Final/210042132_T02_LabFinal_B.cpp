#include <iostream>
#include <stack>
#include <string>

using namespace std;


bool isProperlyParenthesized(const string & expression) {
    stack<char> st;


    for (char c : expression) {

        if (c == '(' || c == '[' || c == '{') {
            st.push(c);
        }

        else if (c == ')' || c == ']' || c == '}') {

            if (st.empty() || (c == ')' && st.top() != '(') || (c == ']' && st.top() != '[') || (c == '}' && st.top() != '{')) {
                return false;
            }

            st.pop();

        }
    }


    return st.empty();
}

int main() {
    int N;
    cin >> N;
    cin.ignore();

    for (int i = 0; i < N; i++) {
        string expression;
        getline(cin, expression);


        string cleanExpression;

        for (char c : expression) {
            if (c != ' ') {
                cleanExpression += c;
            }
        }

        if (isProperlyParenthesized(cleanExpression)) {
            cout << "Yes" << endl;
        } else {
            cout << "No" << endl;
        }
    }

    return 0;
}
