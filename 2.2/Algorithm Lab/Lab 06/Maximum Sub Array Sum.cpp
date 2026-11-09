#include <iostream>
#include <climits>
using namespace std;

int max(int a, int b, int c) {
    return max(max(a, b), c);
}


int maxCrossingSum(int arr[], int low, int mid, int high) {
    int leftSum = INT_MIN;
    int sum = 0;
    for (int i = mid; i >= low; i--) {
        sum += arr[i];
        if (sum > leftSum)
            leftSum = sum;
    }

    int rightSum = INT_MIN;
    sum = 0;
    for (int i = mid + 1; i <= high; i++) {
        sum += arr[i];
        if (sum > rightSum)
            rightSum = sum;
    }

    return leftSum + rightSum;
}


int maxSubArraySum(int arr[], int low, int high) {

    if (low == high)
        return arr[low];


    int mid = (low + high) / 2;


    return max(maxSubArraySum(arr, low, mid),
               maxSubArraySum(arr, mid + 1, high),
               maxCrossingSum(arr, low, mid, high));
}

int main() {
    int n;
    cout << "Enter the size of the array: ";
    cin >> n;

    int arr[n];
    cout << "Enter " << n << " integers for the array:\n";
    for (int i = 0; i < n; i++) {
        cin >> arr[i];
    }

    int maxSum = maxSubArraySum(arr, 0, n - 1);
    cout << "Maximum contiguous sum is " << maxSum << endl;

    return 0;
}
