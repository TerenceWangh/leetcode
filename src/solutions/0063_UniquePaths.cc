#include "solution.h"

using std::vector;

// Runtime: 8 ms, faster than 38.76%
// Memory Usage: 8.1 MB, less than 5.91%

int Solution::uniquePathsWithObstacles(vector<vector<int>>& obstacleGrid)
{
  int m = obstacleGrid.size(), n = obstacleGrid[0].size();
  vector<vector<int>> paths(m, vector<int>(n));

  for (int i = 0; i < m; i++)
  {
    if (obstacleGrid[i][0] == 1)
      break;
    paths[i][0] = 1;
  }

  for (int i = 0; i < n; i++)
  {
    if (obstacleGrid[0][i] == 1)
      break;
    paths[0][i] = 1;
  }

  for (int i = 1; i < m; i++)
  {
    for (int j = 1; j < n; j++)
    {
      if (obstacleGrid[i][j] == 1)
        continue;
      paths[i][j] = paths[i - 1][j] + paths[i][j - 1];
    }
  }
  return paths[m - 1][n - 1];
}
