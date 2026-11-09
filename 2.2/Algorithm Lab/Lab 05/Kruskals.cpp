#include <algorithm>
#include <iostream>
#include <vector>
using namespace std;

#define edge pair<int, int>

class Graph {
private:
    vector<pair<int, edge>> G;
    vector<pair<int, edge>> MST;
    int *parent;
    int V;

public:
    Graph(int V);
    void AddweightedEdge(int u, int v, int w);
    int find_Set(int i);
    void union_set(int u, int v);
    void kruskals();
    void print();
};

Graph::Graph(int V) {
    parent = new int[V];
    for (int i = 0; i < V; i++)
        parent[i] = i;
    G.clear();
    MST.clear();
}

void Graph::AddweightedEdge(int u, int v, int w) {
    G.push_back(make_pair(w, edge(u, v)));
}

int Graph::find_Set(int i) {
    if (i == parent[i])
        return i;
    else
        return find_Set(parent[i]);
}

void Graph::union_set(int u, int v) {
    parent[u] = parent[v];
}

void Graph::kruskals() {
    int i, source, dest;
    sort(G.begin(), G.end());

    for (i = 0; i < G.size(); i++) {
        source = find_Set(G[i].second.first);
        dest = find_Set(G[i].second.second);
        if (source != dest) {
            MST.push_back(G[i]);
            union_set(source, dest);
        }
    }
}

void Graph::print() {
    cout << "Edge : Weight" << endl;
    int cost = 0;
    for (int i = 0; i < MST.size(); i++) {
        cost = cost + MST[i].first;
        cout << MST[i].second.first << " - " << MST[i].second.second << " : "
             << MST[i].first;
        cout << endl;
    }
    cout << "Total cost : " << cost << endl;
}

int main() {
    int V, E;
    cout << "Enter the number of vertices: ";
    cin >> V;
    cout << "Enter the number of edges: ";
    cin >> E;

    Graph g(V);

    cout << "Enter the edges with weights:\n";
    for (int i = 0; i < E; i++) {
        int u, v, w;
        cin >> u >> v >> w;
        g.AddweightedEdge(u, v, w);
    }

    g.kruskals();
    g.print();

    return 0;
}
