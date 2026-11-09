#include <iostream>
#include <vector>
#include <queue>
#include <map>
#include <climits>

using namespace std;

const int MAX_LOCATIONS = 501;
const int INF = INT_MAX;

vector<pair<int, int>> graph[MAX_LOCATIONS];
map<pair<int, int>, int> costs;

int dijkstra(int start, int target) {
    vector<int> distance(MAX_LOCATIONS, INF);
    distance[start] = 0;

    priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> pq;
    pq.push({0, start});

    while (!pq.empty()) {
        int dist = pq.top().first;
        int node = pq.top().second;
        pq.pop();

        if (node == target) {
            return dist;
        }

        if (dist > distance[node]) {
            continue;
        }

        for (const auto& edge : graph[node]) {
            int to = edge.first;
            int weight = edge.second;

            if (dist + weight < distance[to]) {
                distance[to] = dist + weight;
                pq.push({distance[to], to});
            }
        }
    }
    return INF;
}
int main() {
    int N;
    cin >> N;
    for (int i = 0; i < N; i++) {
        int A, B, W;
        cin >> A >> B >> W;
        graph[A].push_back({B, W});
        graph[B].push_back({A, W});
        costs[{A, B}] = W;
        costs[{B, A}] = W;
    }
    int U;
    cin >> U;
    int Q;
    cin >> Q;
    while (Q--) {
        int V;
        cin >> V;
        int minCost = dijkstra(U, V);

        if (minCost == INF) {
            cout << "NO PATH" << endl;
        } else {
            cout << minCost << endl;
        }
    }
    return 0;
}
