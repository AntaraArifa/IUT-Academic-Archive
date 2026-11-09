#include <iostream>
#include <list>

class DFSTraversal {
private:
    int V;
    std::list<int>* adj;
    bool* visited;

public:
    DFSTraversal(int vertices) {
        V = vertices;
        adj = new std::list<int>[V];
        visited = new bool[V];

        for (int i = 0; i < V; ++i) {
            visited[i] = false;
        }
    }

    void AddEdge(int src, int dest) {
        adj[src].push_back(dest);
    }

    void DFS(int vertex) {
        visited[vertex] = true;
        std::cout << vertex << " ";

        for (int& n : adj[vertex]) {
            if (!visited[n]) {
                DFS(n);
            }
        }
    }
};

int main() {
    int V, E;
    std::cout << "Enter the number of vertices: ";
    std::cin >> V;
    std::cout << "Enter the number of edges: ";
    std::cin >> E;

    DFSTraversal graph(V);

    std::cout << "Enter " << E << " edges in the format (source destination):\n";
    for (int i = 0; i < E; ++i) {
        int src, dest;
        std::cin >> src >> dest;
        graph.AddEdge(src, dest);
    }

    std::cout << "Depth First Traversal for the graph is:" << std::endl;
    graph.DFS(0);

    return 0;
}
