#include<iostream>

using namespace std;

struct node
{
    int data;
    node *left,*right;
};

node *newNode(int x)
{
    node *temp =  new node;
    temp->data = x;
    temp->left = temp->right = NULL;
    return temp;
}

node *insert(node *root,int x)
{
    if(root == NULL)
    {
        return newNode(x);
    }
    if(x<root->data)
    {
        root->left=insert(root->left,x);
    }
    else if(x>root->data)
    {
       root->right=insert(root->right,x);
    }

    return root;
}


int main() {
    int N;
    cin >> N;
    cin.ignore();

    for (int i = 0; i < N; i++)
    {
        node *root = NULL;
        int t;
        while(cin >> t)
        {
            root = insert(root,t);
        }

        if () {
            cout << "Yes" << endl;
        } else {
            cout << "No" << endl;
        }
    }

    return 0;
}


