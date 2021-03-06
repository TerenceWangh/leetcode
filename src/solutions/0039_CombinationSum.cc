#include "solution.h"

using std::vector;

static void internalCombinationSum(
    vector<vector<int>> &result,
    vector<int> &candidates,
    vector<int> &combination,
    int target,
    int index)
{
  if (target < 0)
    return;
  if (target == 0)
  {
    result.push_back(combination);
    return;
  }

  int c;
  for (unsigned i = index; i < candidates.size(); i++)
  {
    c = candidates[i];
    combination.push_back(c);
    internalCombinationSum(result, candidates, combination, target - c, i);
    combination.pop_back();
  }
}

vector<vector<int>>
Solution::combinationSum(vector<int> &candidates, int target)
{
  vector<vector<int>> res;
  vector<int> combination;

  int c;
  for (unsigned i = 0; i < candidates.size(); i++)
  {
    c = candidates[i];
    combination.push_back(c);
    internalCombinationSum(res, candidates, combination, target - c, i);
    combination.pop_back();
  }
  return res;
}
