#include <iostream>

using namespace std;

int getMax(int a[], int n) {
   int max = a[0];
   for(int i = 1; i<n; i++) {
      if(a[i] > max)
         max = a[i];
   }
   return max;
}

void countSort(int a[], int n)
{
   int output[n+1];
   int max = getMax(a, n);
   int count[max+1];


  for (int i = 0; i <= max; ++i)
  {
    count[i] = 0;
  }

  for (int i = 0; i < n; i++)
  {
    count[a[i]]++;
  }

   for(int i = 1; i<=max; i++)
      count[i] += count[i-1];


  for (int i = n - 1; i >= 0; i--) {
    output[count[a[i]] - 1] = a[i];
    count[a[i]]--;
}

   for(int i = 0; i<n; i++) {
      a[i] = output[i];
   }
}

void printArr(int a[], int n)
{
    int i;
    for (i = 0; i < n; i++)
        cout<<a[i]<<" ";
}

int main() {
    int n;
    cin >> n;
    int arr[10];

    for(int i=0; i<n; i++){
        cin >> arr[i];
    }
    countSort(arr, n);
    cout<<"\nAfter sorting array elements are - \n";
    printArr(arr, n);
    return 0;
}
