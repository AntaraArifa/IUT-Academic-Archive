#include <iostream>
#include <vector>

using namespace std;

vector<vector<char>> map;
vector<vector<bool>> visited;
int n, m;

void dfs(int x, int y)
{
     if (x < 0 || x >= n || y < 0 || y >= m || map[x][y] == '#' || visited[x][y])
        return;

    visited[x][y] = true;

    dfs(x + 1, y);
    dfs(x - 1, y);
    dfs(x, y + 1);
    dfs(x, y - 1);
}

int countRooms()
{
    int count = 0;
    visited.assign(n, vector<bool>(m, false));

    for (int i = 0; i < n; ++i)
    {
        for (int j = 0; j < m; ++j)
        {
            if (map[i][j] == '.' && !visited[i][j])
            {
                ++count;
                dfs(i, j);
            }
        }
    }

    return count;
}

int main()
{
    cin >> n >> m;
    map.assign(n, vector<char>(m));

    for(int i=0; i<n; ++i)
    {

      for (int j=0; j<m; ++j)
      {
          cin >> map[i][j];
      }
    }

    cout << countRooms() << endl;

    return 0;
}

// Antara Arifa Mullick
// 210042132
