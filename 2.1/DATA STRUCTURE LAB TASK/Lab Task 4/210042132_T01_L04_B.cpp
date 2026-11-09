#include <iostream>
using namespace std;

class CircularQueue {
private:
    int* arr;
    int front;
    int rear;
    int capacity;
    int size;

public:
    CircularQueue(int cap) {
        capacity = cap;
        arr = new int[capacity];
        front = -1;
        rear = -1;
        size = 0;
    }

    ~CircularQueue() {
        delete[] arr;
    }

    bool isEmpty() {
        return size == 0;
    }

    bool isFull() {
        return size == capacity;
    }

    int getSize() {
        return size;
    }

    void Enqueue(int x) {
        if (isFull()) {
            cout << "Queue is full. Cannot enqueue." << endl;
            return;
        }
        rear = (rear + 1) % capacity;
        arr[rear] = x;
        if (front == -1) {
            front = rear;
        }
        size++;
        cout << "Enqueued " << x << endl;
    }

    int Dequeue() {
        if (isEmpty()) {
            cout << "Queue is empty. Cannot dequeue." << endl;
            return -1;
        }
        int element = arr[front];
        if (front == rear) {
            front = rear = -1;
        } else {
            front = (front + 1) % capacity;
        }
        size--;
        cout << "Dequeued " << element << endl;
        return element;
    }

    int frontElement() {
        if (isEmpty()) {
            cout << "Queue is empty." << endl;
            return -1;
        }
        return arr[front];
    }

    int rearElement() {
        if (isEmpty()) {
            cout << "Queue is empty." << endl;
            return -1;
        }
        return arr[rear];
    }
};

int main() {
    int capacity;
    cout << "Enter the capacity of the circular queue: ";
    cin >> capacity;

    CircularQueue cq(capacity);

    while (true) {
        cout << "Choose an operation:" << endl;
        cout << "1. Enqueue" << endl;
        cout << "2. Dequeue" << endl;
        cout << "3. Check if empty" << endl;
        cout << "4. Check if full" << endl;
        cout << "5. Get size" << endl;
        cout << "6. Get front element" << endl;
        cout << "7. Get rear element" << endl;
        cout << "8. Exit" << endl;
        cout << "Enter your choice: ";

        int choice;
        cin >> choice;

        switch (choice) {
            case 1:
                int x;
                cout << "Enter the element to enqueue: ";
                cin >> x;
                cq.Enqueue(x);
                break;
            case 2:
                cq.Dequeue();
                break;
            case 3:
                cout << "Queue is empty: " << cq.isEmpty() << endl;
                break;
            case 4:
                cout << "Queue is full: " << cq.isFull() << endl;
                break;
            case 5:
                cout << "Queue size: " << cq.getSize() << endl;
                break;
            case 6:
                cout << "Front element: " << cq.frontElement() << endl;
                break;
            case 7:
                cout << "Rear element: " << cq.rearElement() << endl;
                break;
            case 8:
                exit(0);
            default:
                cout << "Invalid choice. Try again." << endl;
        }
    }

    return 0;
}
