#include <iostream>

int heapSize;
int value;
int index, key;
int index1, key1;

void heapify(int arr[], int index)
{
    int root = index; // for index starting from 0
    int left = 2 * index + 1;
    int right = 2 * index + 2;
    if (left < heapSize && arr[left] < arr[root])
        root = left;
    if (right < heapSize && arr[right] < arr[root])
        root = right;
    if (root != index)
    {
        int temp = arr[index];
        arr[index] = arr[root];
        arr[root] = temp;
        heapify(arr, root);
    }
}

void build_min_heap(int heap[])
{
    for (int i = heapSize; i >= 0; i--)
        heapify(heap, i);
}

int Heap_Minimum(int heap[])
{
    return heap[0];
}

int Heap_extract_min(int heap[])
{
    int temp = heap[0];
    heap[0] = heap[heapSize - 1];
    heapSize--;
    heapify(heap, 0);
    return temp;
}

void Min_heap_insert(int heap[], int value)
{
    heapSize++;
    heap[heapSize - 1] = value;
    build_min_heap(heap);
}

void Heap_decrease_key(int p, int k, int heap[])
{
    heap[p] -= k;
    build_min_heap(heap);
}

void Heap_increase_key(int p, int k, int heap[])
{
    heap[p] += k;
    build_min_heap(heap);
}

int main()
{
    int arr[100], i = 0, n;
    std::cin >> n;
    while (n != -1)
    {
        arr[i] = n;
        i++;
        std::cin >> n;
    }
    heapSize = i;
    build_min_heap(arr);
    std::cout << "Produced Min Heap: ";
    for (i = 0; i < heapSize; i++)
    {
        std::cout << arr[i] << " ";
    }
    std::cout << "\n";
    int choice;
    while (choice != -1)
    {
        std::cin >> choice;
        switch (choice)
        {
        case 1:
            std::cout << Heap_Minimum(arr) << std::endl;
            for (i = 0; i < heapSize; i++)
            {
                std::cout << arr[i] << " ";
            }
            std::cout << "\n";
            break;
        case 2:
            std::cout << Heap_extract_min(arr) << std::endl;
            for (i = 0; i < heapSize; i++)
            {
                std::cout << arr[i] << " ";
            }
            std::cout << "\n";
            break;
        case 3:
            std::cin >> value;
            Min_heap_insert(arr, value);
            for (i = 0; i < heapSize; i++)
            {
                std::cout << arr[i] << " ";
            }
            std::cout << "\n";
            break;
        case 4:
            std::cin >> index >> key;
            Heap_decrease_key(index - 1, key, arr);
            for (i = 0; i < heapSize; i++)
            {
                std::cout << arr[i] << " ";
            }
            std::cout << "\n";
            break;
        case 5:
            std::cin >> index1 >> key1;
            Heap_increase_key(index1 - 1, key1, arr);
            for (i = 0; i < heapSize; i++)
            {
                std::cout << arr[i] << " ";
            }
            std::cout << "\n";
            break;
        }
    }
    return 0;
}
