#include <iostream>
#include <vector>

using namespace std;

vector<int> findTallerClockwise(const vector<int>& heights) {
    int n = heights.size();
    vector<int> result(n, -1);

    for (int i = 0; i < n; ++i) {
        int current_height = heights[i];
        for (int j = 1; j < n; ++j) {
            int next_index = (i + j) % n;
            if (heights[next_index] > current_height) {
                result[i] = heights[next_index];
                break;
            }
        }
    }

    return result;
}

int main() {
    int t;
    if (!(cin >> t)) {
        cerr << "Invalid input for the number of test cases." << endl;
        return 1;
    }

    while (t--) {
        vector<int> v1;
        int inp;
        while (true) {
            if (!(cin >> inp)) {
                cerr << "Invalid input for test case." << endl;
                return 1;
            }
            if (inp != -1) {
                v1.push_back(inp);
            } else {
                break;
            }
        }

        vector<int> v2 = findTallerClockwise(v1);


        for (int i = 0; i < v2.size(); i++) {
            cout << v2[i] << " ";
        }

        cout << "\n";
    }

    return 0;
}
