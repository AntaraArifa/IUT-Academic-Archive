#include <iostream>
#include <vector>

using namespace std;

int main()
{
    int n;

    cout << "Enter the number of elements in the array: ";
    cin >> n;

    vector<int> nums(n);

    cout << "Enter the elements of the array:" << endl;
    for (int i = 0; i < n; i++)
    {
        cin >> nums[i];
    }

    int target;

    cout << "Enter the target value: ";
    cin >> target;

    int found = 0;

    cout << "Task 1: ";
    for (int i = 0; i < n - 1; i++)
    {
        for (int j = i + 1; j < n; j++)
        {
            if (nums[i] + nums[j] == target)
            {
                cout << "(" << i << "," << j << ") ";
                found = 1;
            }
        }
    }

    if (!found)
    {
        cout << "Does not exist." << endl;
    }
    else
    {
        cout << endl;
    }

    int count = 0;
    for (int i = 0; i < n - 1; i++)
    {
        for (int j = i + 1; j < n; j++)
        {
            if (nums[i] + nums[j] == target)
            {
                count++;
            }
        }
    }
    cout << "Task 2: " << count << " pairs." << endl;

    return 0;
}
