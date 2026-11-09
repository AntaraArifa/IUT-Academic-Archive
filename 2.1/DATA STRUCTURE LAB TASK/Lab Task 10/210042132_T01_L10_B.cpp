/*#include<iostream>
using namespace std;

struct node{
    int data;
    node *left,*right;
};

node *newNode(int x){
    node *temp=new node;
    temp->data=x;
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
    return root;
}

void inorder(node *root){
    if(root==NULL)
        return;
    inorder(root->left);
    cout<<root->data<<" ";
    inorder(root->right);
}

bool check(node *root,int x){
    if(root==NULL)
        return true;
    if(abs(root->data-x)<=3)
        return false;
    if(root->data>x)
        return check(root->left,x);
    return check(root->right,x);
}

bool insert_check(node *&root,int x){
    if(check(root,x)){
        root=insert(root,x);
        return true;
    }
    return false;
}

int main(){
    node *root=NULL;
    int x;
    while(cin>>x){
        if(x==-1)
            break;
        if(insert_check(root,x))
            inorder(root),cout<<endl;
        else
            cout<<"(Reservation failed)"<<endl;
    }
    return 0;
}
*/
#include <iostream>
#include <climits>

using namespace std;

struct TreeNode
{
    int val;
    TreeNode *left, *right;
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
};

bool isValidBST(TreeNode *root, long long lower = LLONG_MIN, long long upper = LLONG_MAX)
{
    if (root == nullptr)
    {
        return true;
    }

    if (root->val <= lower || root->val >= upper)
    {
        return false;
    }

    return isValidBST(root->left, lower, root->val) && isValidBST(root->right, root->val, upper);
}

TreeNode *insert(TreeNode *root, int x)
{
    if (root == nullptr)
    {
        return new TreeNode(x);
    }
    if (x < root->val)
    {
        root->left = insert(root->left, x);
    }
    else if (x > root->val)
    {
        root->right = insert(root->right, x);
    }

    return root;
}

int main()
{
    TreeNode *root = nullptr;
    int x;

    cout << "Enter values to insert into the binary search tree (enter a non-integer to stop):" << endl;

    // Allow the user to input multiple values
    while (cin >> x)
    {
        root = insert(root, x);
    }

    // Check if the tree is a valid BST
    if (isValidBST(root))
    {
        cout << "The binary tree is a valid BST.\n";
    }
    else
    {
        cout << "The binary tree is not a valid BST.\n";
    }

    // Clean up allocated memory (assuming you have a function to delete the tree)
    // ...

    return 0;
}
