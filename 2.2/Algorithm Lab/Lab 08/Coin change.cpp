#include <iostream>
#include <vector>
#include <climits>

using namespace std;

int coinChange(vector<int>& coins, int amount) {
    vector<int> dp(amount + 1, INT_MAX);
    dp[0] = 0;
    for (int i = 1; i <= amount; i++) {
        for (int j = 0; j < coins.size(); j++) {
            if (coins[j] <= i) {
                dp[i] = min(dp[i], dp[i - coins[j]] + 1);
            }
        }
    }
    return dp[amount] == INT_MAX ? -1 : dp[amount];
}

int main() {
    int n, amount;
    cout << "Enter the number of coins: ";
    cin >> n;
    cout << "Enter the target amount: ";
    cin >> amount;

    vector<int> coins(n);
    cout << "Enter the values of the coins:\n";
    for (int i = 0; i < n; i++) {
        cin >> coins[i];
    }

    int minCoins = coinChange(coins, amount);
    cout << "Minimum number of coins needed: " << minCoins << endl;
    return 0;
}
