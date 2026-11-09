#include<iostream>
#include<ctime>
int findPeakLinear(int arr[],int size)
{
    for(int i=0; i<size-1; i++)
    {
        if(arr[i]>=arr[i+1])
        {
            return arr[i];
        }
    }
    return arr[size - 1];
}
int findPeakDivideAndConquer(int arr[],int left,int right)
{
    if(left==right)
    {
        return arr[left];
    }
    int mid =left +(right-left)/2;
    if (arr[mid] >= arr[mid + 1]) {
        return findPeakDivideAndConquer(arr, left, mid);
    } else {
        return findPeakDivideAndConquer(arr, mid + 1, right);
    }

}

int main()
{
    int size = 1000000;
    int* array2 = new int[size];
    for(int i=0; i<size -2; i++)
    {
        array2[i]=i;
    }
    array2[size-1]=0;

    clock_t startTime = clock();
    int peak1= findPeakLinear(array2,size);
    clock_t endTime = clock();
    double elapsedTime1 = double(endTime-startTime);
    std::cout<<"Linear approach for size "<<size<<": "<<elapsedTime1<<peak1<<std::endl;

    startTime = clock();
    int peak2 = findPeakDivideAndConquer(array2, 0, size - 1);
    endTime = clock();
    double elapsedTime2 = double(endTime - startTime);
    std::cout << "Divide and Conquer approach for size " << size << ": " << elapsedTime2<< peak2 << std::endl;

    delete[] array2;
    return 0;

}
