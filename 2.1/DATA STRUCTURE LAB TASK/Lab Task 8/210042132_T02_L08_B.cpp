#include <iostream>
#include <vector>

using namespace std;

const int MAX_N = 100005;
vector<int> graph[MAX_N];
vector<int> cats(MAX_N, 0);
vector<bool> visited(MAX_N, false);
int maxConsecutiveCats, maxLeaves;

void dfs(int node, int consecutiveCats) {
    visited[node] = true;

    if (cats[node] == 1) {
        consecutiveCats++;
    } else {
        consecutiveCats = 0;
    }

    if (consecutiveCats > maxConsecutiveCats) {
        return;
    }

    bool isLeaf = true;
    for (int neighbor : graph[node]) {
        if (!visited[neighbor]) {
            isLeaf = false;
            dfs(neighbor, consecutiveCats);
        }
    }

    if (isLeaf) {
        maxLeaves++;
    }
}

int main() {
    int n, m;
    cin >> n >> m;

    maxConsecutiveCats = m;

    for (int i = 1; i <= n; i++) {
        cin >> cats[i];
    }

    for (int i = 1; i < n; i++) {
        int u, v;
        cin >> u >> v;
        graph[u].push_back(v);
        graph[v].push_back(u);
    }

    maxLeaves = 0;
    dfs(1, 0);

    cout << maxLeaves << endl;

    return 0;
}
