#include<bits/stdc++.h>
using namespace std;

struct Node {
    int val;
    Node* left;
    Node* right;
    Node(int x) : val(x), left(NULL), right(NULL) {}
};

bool isMirror(Node* node1, Node* node2) {
    if (node1 == NULL && node2 == NULL)
        return true;
    if (node1 != NULL && node2 != NULL && node1->val == node2->val)
        return (isMirror(node1->left, node2->right) && isMirror(node1->right, node2->left));
    return false;
}

bool isSymmetric(Node* root) {
    return isMirror(root, root);
}

int main() {
    Node* root = new Node(1);
    root->left = new Node(2);
    root->right = new Node(2);
    root->left->left = new Node(3);
    root->left->right = new Node(4);
    root->right->left = new Node(4);
    root->right->right = new Node(3);

    if(isSymmetric(root))
        cout << "Yes";
    else
        cout << "No";

    return 0;
}
