#include <iostream>
#include <vector>
#include <queue>

using namespace std;

int main() {
    int N, K;
    cin >> N >> K;

    vector<int> cookies(N);
    for (int i = 0; i < N; i++) {
        cin >> cookies[i];
    }


    priority_queue<int, vector<int>, greater<int>> pq(cookies.begin(), cookies.end());

    int operations = 0;

    while (pq.size() >= 2 && pq.top() < K) {
        int least_sweet = pq.top();
        pq.pop();
        int second_least_sweet = pq.top();
        pq.pop();

        int new_cookie = least_sweet + 2 * second_least_sweet;
        pq.push(new_cookie);

        operations++;
    }

    if (pq.top() < K) {
        cout << -1 << endl;
    } else {
        cout << operations << endl;
    }

    return 0;
}
