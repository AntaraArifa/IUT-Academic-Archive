#include<iostream>
#include<vector>
using namespace std;
vector<int>find2DPeak(vector<vector<int>>arr
                     )
{
    vector<int>arr2;
    int row =arr.size();
    int column =arr[0].size();
    for(int i=0; i<row; i++)
    {
        for(int j=0; j<column; j++)
        {
            if(i>0)
                if(arr[i][j]<arr[i-1][j])
                    continue;

            if(j>0)
                if(arr[i][j]<arr[i][j-1])
                    continue;
            if(j<column -1)
                if(arr[i][j]<arr[i][j+1])
                    continue;
            if(i<row -1)
                if(arr[i][j]<arr[i+1][j])
                    continue;
            arr2.push_back(i);
            arr2.push_back(j);
            break;
        }

    }
    return arr2;

}
int findMaxIndex(vector<vector<int>>& mat,int n,int col)
{
    int Max=-1;
    int index =-1;
    for(int i=0; i<n; i++)
    {
        if(mat[i][col]>Max)
        {
            Max=mat[i][col];
            index=i;

        }
    }
    return index;
}
vector<int>find2DPeakGridDivideandConquer(vector<vector<int>>&mat)
{
    int n=mat.size();
    int m=mat[0].size();
    int low=0,high=m-1;
    while(low<=high)
    {
        int mid=(low+high)/2;
        int maxRowIndex=findMaxIndex(mat, n, mid);

        int left =(mid>0)? mat[maxRowIndex][mid-1]:-1;
        int right =(mid<m-1)?mat[maxRowIndex][mid+1]:-1;
        if(mat[maxRowIndex][mid]>left&& mat[maxRowIndex][mid]>right)
        {
            return {maxRowIndex,mid};
        }
        else if (mat[maxRowIndex][mid]<left)
        {
            high = mid-1;
        }
        else
        {
            low = mid+1;
        }

    }
    return {-1, -1};
}
vector<int>find2DPeakGreedy(vector<vector<int>>&mat)
{
    int n=mat.size();
    int m=mat[0].size();
    int col =m/2;

    // Finding the row index with the maximum value in the middle column
    int maxRowIndex=0;
    for(int i=1; i<n; ++i)
    {
        if(mat[i][col]>mat[maxRowIndex][col])
        {
            maxRowIndex=i;

        }
    }
    while(col>0 && mat[maxRowIndex][col]<mat[maxRowIndex][col-1])
    {
        --col;
    }
    while (col < m - 1 && mat[maxRowIndex][col] < mat[maxRowIndex][col + 1])
    {
        ++col;
    }
    return {maxRowIndex, col};
}
int main()
{

    vector<vector<int>> matrix=
    {
        {1, 3, 20, 4},
        {5, 6, 7, 8},
        {2, 10, 8, 9},
        {15, 13, 12, 14}
    };

    vector<int> result = find2DPeak(matrix);
    cout << "Peak element found at index: " << result[0]
         << ", " << result[1] << endl;

    vector<int> result1 = find2DPeakGridDivideandConquer(matrix);
    cout << "Peak element found at index: " << result1[0]
         << ", " << result1[1] << endl;

         vector<int> result2 = find2DPeakGreedy(matrix);

    cout << "Peak element found at index: " << result[0]
         << ", " << result[1] << endl;

    return 0;

}



