#include <iostream>
#include <vector>
using namespace std;

int rodCutting(vector<int>& prices, int length) {
    if (length <= 0)
        return 0;

    int maxRevenue = INT_MIN;
    for (int i = 0; i < length; ++i) {
        maxRevenue = max(maxRevenue, prices[i] + rodCutting(prices, length - i - 1));
    }

    return maxRevenue;
}

int main() {
    int n;
    cout << "Enter the number of rod pieces: ";
    cin >> n;

    vector<int> prices(n);
    cout << "Enter the prices of rod pieces: ";
    for (int i = 0; i < n; ++i) {
        cin >> prices[i];
    }

    int length;
    cout << "Enter the length of the rod: ";
    cin >> length;

    cout << "Maximum revenue: " << rodCutting(prices, length) << endl;

    return 0;
}
