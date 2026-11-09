#include <iostream>
using namespace std;

struct node {
    int data;
    int count;
    node *left, *right;
};

node *newNode(int x){
    node *temp=new node;
    temp->data=x;
    temp->count = 1;
    temp->left=temp->right=NULL;
    return temp;
}

node *insert(node *root,int x){
    if(root==NULL)
        return newNode(x);
    if(x<root->data)
        root->left=insert(root->left,x);
    else if(x>root->data)
        root->right=insert(root->right,x);

    root->count = 1 + (root->left ? root->left->count : 0) + (root->right ? root->right->count : 0);

    return root;
}

int countReservationsBefore(node* root, int data) {
    if (root == nullptr) {
        return 0;
    }
    if (data <= root->data) {
        return countReservationsBefore(root->left, data);
    } else {
        return 1 + (root->left ? root->left->count : 0) + countReservationsBefore(root->right, data);
    }
}

int main() {
    node* root = nullptr;

    cout << "Enter reservations (enter -1 to stop):\n";

    int reservation;
    cin >> reservation;

    while (reservation != -1) {
        root = insert(root, reservation);
        cin >> reservation;
    }

    cout << "Enter the number of queries:\n";
    int numQueries;
    cin >> numQueries;

    cout << "Enter the timestamps for queries:\n";
    for (int i = 0; i < numQueries; ++i) {
        int queryTimestamp;
        cin >> queryTimestamp;

        int result = countReservationsBefore(root, queryTimestamp);
        cout << result << endl;
    }

    return 0;
}
