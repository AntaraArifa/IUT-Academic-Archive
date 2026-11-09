#include <iostream>
using namespace std;

const int MAX_SIZE = 105; // Maximum size of the double-ended queue

int main() {
    int T;
    cin >> T;

    for (int tc = 1; tc <= T; tc++) {
        int n, m;
        cin >> n >> m;

        int dq[MAX_SIZE];
        int left = MAX_SIZE / 2; // Left end pointer
        int right = left - 1;   // Right end pointer
        cout << "Case " << tc << ":" << endl;

        for (int i = 0; i < m; i++) {
            string operation;
            cin >> operation;

            if (operation == "pushLeft") {
                int x;
                cin >> x;
                if (right - left + 1 < n) {
                    dq[left--] = x;
                    cout << "Pushed in left: " << x << endl;
                } else {
                    cout << "The queue is full" << endl;
                }
            } else if (operation == "pushRight") {
                int x;
                cin >> x;
                if (right - left + 1 < n) {
                    dq[++right] = x;
                    cout << "Pushed in right: " << x << endl;
                } else {
                    cout << "The queue is full" << endl;
                }
            } else if (operation == "popLeft") {
                if (left <= right) {
                    cout << "Popped from left: " << dq[++left] << endl;
                } else {
                    cout << "The queue is empty" << endl;
                }
            } else if (operation == "popRight") {
                if (left <= right) {
                    cout << "Popped from right: " << dq[right--] << endl;
                } else {
                    cout << "The queue is empty" << endl;
                }
            }
        }
    }

    return 0;
}
