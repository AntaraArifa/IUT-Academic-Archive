#include <iostream>
#include <vector>
#include <queue>
#include <limits>
#include <utility>
using namespace std;

#define INF numeric_limits<int>::max()

class Graph {
private:
    vector<vector<pair<int, int>>> adjList;
    int V;

public:
    Graph(int V);
    void AddWeightedEdge(int u, int v, int w);
    vector<int> Dijkstra(int source);
};

Graph::Graph(int V) : V(V) {
    adjList.resize(V);
}

void Graph::AddWeightedEdge(int u, int v, int w) {
    adjList[u].push_back(make_pair(v, w));
}

vector<int> Graph::Dijkstra(int source) {
    vector<int> dist(V, INF);
    dist[source] = 0;

    priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> pq;
    pq.push(make_pair(0, source));

    while (!pq.empty()) {
        int u = pq.top().second;
        int uDist = pq.top().first;
        pq.pop();

        if (uDist > dist[u]) continue;

        for (const auto& neighbor : adjList[u]) {
            int v = neighbor.first;
            int weight = neighbor.second;

            if (dist[u] + weight < dist[v]) {
                dist[v] = dist[u] + weight;
                pq.push(make_pair(dist[v], v));
            }
        }
    }

    return dist;
}

int main() {
    int V, E;
    cout << "Enter the number of vertices: ";
    cin >> V;
    cout << "Enter the number of edges: ";
    cin >> E;

    Graph g(V);

    cout << "Enter the edges with weights:\n";
    for (int i = 0; i < E; ++i) {
        int u, v, w;
        cin >> u >> v >> w;
        g.AddWeightedEdge(u, v, w);
    }

    int source;
    cout << "Enter the source node: ";
    cin >> source;

    vector<int> shortestPaths = g.Dijkstra(source);

    cout << "Shortest distances from source node " << source << ":\n";
    for (int i = 0; i < shortestPaths.size(); ++i) {
        cout << "Node " << i << ": " << shortestPaths[i] << endl;
    }

    return 0;
}
