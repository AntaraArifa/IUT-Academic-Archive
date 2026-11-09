#include <iostream>
#include <vector>
#include <queue>
using namespace std;

struct TreeNode {
    int val;
    TreeNode* left;
    TreeNode* right;
};

void preOrder(TreeNode* root) {
    if (root == nullptr)
        return;

    cout << root->val << ' ';
    preOrder(root->left);
    preOrder(root->right);
}

void inOrder(TreeNode* root) {
    if (root == nullptr)
        return;

    inOrder(root->left);
    cout << root->val << ' ';
    inOrder(root->right);
}

void postOrder(TreeNode* root) {
    if (root == nullptr)
        return;

    postOrder(root->left);
    postOrder(root->right);
    cout << root->val << ' ';
}

void levelOrder(TreeNode* root) {
    queue<TreeNode*> level;
    level.push(root);

    while(!level.empty())
    {
        TreeNode *temp = level.front();
        level.pop();

        if(temp==nullptr)
            continue;
        cout<<temp->val<<' ';

        level.push(temp->left);
        level.push(temp->right);
    }
}



int main() {
    int n;
    cin >> n;
    vector<TreeNode> nodes(n + 1);

    for (int i = 1; i <= n; i++) {
        nodes[i].val = i;
    }

    for (int i = 0; i < n; i++) { // Changed the loop condition from i <= n to i < n
        int val, parent, child;
        cin >> val >> parent >> child;

        if (child == 1)
            nodes[parent].left = &nodes[val];
        if (child == 2)
            nodes[parent].right = &nodes[val];
    }

    levelOrder(&nodes[1]);
    cout << endl;
    inOrder(&nodes[1]);
    cout << endl;
    preOrder(&nodes[1]);
    cout << endl;
    postOrder(&nodes[1]);
    cout << endl;

    return 0;
}
