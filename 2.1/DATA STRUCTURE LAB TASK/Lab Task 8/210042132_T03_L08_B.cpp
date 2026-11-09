#include <iostream>
#include <vector>

using namespace std;


const int dx[] = {1, -1, 0, 0, 1, -1, 1, -1};
const int dy[] = {0, 0, 1, -1, 1, -1, -1, 1};

void dfs(vector<vector<char>>& grid, int x, int y) {
    int m = grid.size();
    int n = grid[0].size();


    grid[x][y] = '*';


    for (int i = 0; i < 8; i++) {
        int newX = x + dx[i];
        int newY = y + dy[i];


        if (newX >= 0 && newX < m && newY >= 0 && newY < n && grid[newX][newY] == '@') {
            dfs(grid, newX, newY);
        }
    }
}

int countOilDeposits(vector<vector<char>>& grid) {
    int m = grid.size();
    int n = grid[0].size();
    int count = 0;

    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            if (grid[i][j] == '@') {
                count++;
                dfs(grid, i, j);
            }
        }
    }

    return count;
}

int main() {
    while (true) {
        int m, n;
        cin >> m >> n;

        if (m == 0) {
            break;
        }

        vector<vector<char>> grid(m, vector<char>(n));

        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                cin >> grid[i][j];
            }
        }

        int deposits = countOilDeposits(grid);
        cout << deposits << endl;
    }

    return 0;
}
