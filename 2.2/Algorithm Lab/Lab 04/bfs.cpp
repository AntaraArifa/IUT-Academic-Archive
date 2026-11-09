#include <iostream>
#include <vector>
#include <list>

class Graph {
private:
    int V;
    std::vector<std::list<int>> adj;

public:
    Graph(int Vertices);
    void addEdge(int v, int w);
    void BFS(int s);
};

Graph::Graph(int V) {
    this->V = V;
    adj.resize(V);
}

void Graph::addEdge(int v, int w) {
    adj[v].push_back(w);
}

void Graph::BFS(int s) {
    std::vector<bool> visited(V, false);
    std::list<int> queue;
    visited[s] = true;
    queue.push_back(s);
    while (!queue.empty()) {
        s = queue.front();
        std::cout << s << " ";
        queue.pop_front();

        for (auto adjacent : adj[s]) {
            if (!visited[adjacent]) {
                visited[adjacent] = true;
                queue.push_back(adjacent);
            }
        }
    }
}

int main() {
    int V, E;
    std::cout << "Enter the number of vertices: ";
    std::cin >> V;
    std::cout << "Enter the number of edges: ";
    std::cin >> E;

    Graph g(V);

    std::cout << "Enter " << E << " edges in the format (source destination):\n";
    for (int i = 0; i < E; ++i) {
        int src, dest;
        std::cin >> src >> dest;
        g.addEdge(src, dest);
    }

    int startVertex;
    std::cout << "Enter the starting vertex for BFS traversal: ";
    std::cin >> startVertex;

    std::cout << "Breadth First Traversal starting from vertex " << startVertex << ":\n";
    g.BFS(startVertex);

    return 0;
}
