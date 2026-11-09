#include <iostream>
using namespace std;

class Stack {
private:
    int maxSize;
    int top;
    int* stack;

public:
    Stack(int size) {
        maxSize = size;
        stack = new int[maxSize];
        top = -1;
    }

    bool isEmpty() {
        return top == -1;
    }

    bool isFull() {
        return top == maxSize - 1;
    }

    void push(int element) {
        if (!isFull()) {
            top++;
            stack[top] = element;
            cout << element << endl;
        }
    }

    void pop() {
        if (!isEmpty()) {
            top--;
        }
    }

    int size() {
        return top + 1;
    }

    int topElement() {
        if (!isEmpty()) {
            return stack[top];
        }
        return -1;
    }

    ~Stack() {
        delete[] stack;
    }
};

int main() {
    int n;
    cin >> n;
    Stack stack(n);

    int functionID, param;
    while (true) {
        cin >> functionID;
        if (functionID == -1) {
            break;
        }

        switch (functionID) {
            case 1:
                cin >> param;
                stack.push(param);
                break;
            case 2:
                if (!stack.isEmpty()) {
                    stack.pop();
                } else {
                    cout << "Underflow" << endl;
                }
                break;
            case 3:
                cout << (stack.isEmpty() ? "True" : "False") << endl;
                break;
            case 4:
                cout << (stack.isFull() ? "True" : "False") << endl;
                break;
            case 5:
                cout << stack.size() << endl;
                break;
            case 6:
                cout << stack.topElement() << endl;
                break;
        }
    }

    return 0;
}



