#include <iostream>
using namespace std;

struct Node {
    int data;
    Node* left;
    Node* right;
    Node* parent;
};

class BinaryTree {
public:
    Node* root;

    // Constructor
    BinaryTree() {
        root = nullptr;
    }

    // Insert function
    void insert(int data, int parentData, int childType) {
        Node* newNode = new Node();
        newNode->data = data;
        newNode->left = nullptr;
        newNode->right = nullptr;

        if (childType == 1) {
            findAndInsert(root, parentData, newNode, true);
        } else if (childType == 2) {
            findAndInsert(root, parentData, newNode, false);
        } else {
            root = newNode;
        }
    }
    void remove(int data) {
        removeNode(root, data);
    }
// Search function
   void search(int data) {
        Node* result = findNode(root, data);

        if (result != nullptr) {
            cout << "Node found. Left Child: ";
            if (result->left != nullptr)
                cout << result->left->data;
            else
                cout << "null";

            cout << ", Right Child: ";
            if (result->right != nullptr)
                cout << result->right->data;
            else
                cout << "null";

            cout << endl;
        } else {
            cout << "Node not found" << endl;
        }
    }

    // Height function
    int getHeight(Node* node) {
        if (node == nullptr)
            return -1; // Height of an empty tree is -1

        int leftHeight = getHeight(node->left);
        int rightHeight = getHeight(node->right);

        return max(leftHeight, rightHeight) + 1;
    }

    // Preorder Traversal function
    void preorderTraversal(Node* node) {
        if (node == nullptr)
            return;

        cout << "Node: " << node->data;
        if (node->parent != nullptr) {
            cout << " (Parent: " << node->parent->data << ")";
        }
        cout << endl;

        preorderTraversal(node->left);
        preorderTraversal(node->right);
    }

private:
    void findAndInsert(Node* currentNode, int parentData, Node* newNode, bool isLeft) {
        if (currentNode == nullptr)
            return;

        if (currentNode->data == parentData) {
            if (isLeft) {
                currentNode->left = newNode;
            } else {
                currentNode->right = newNode;
            }
            newNode->parent = currentNode;
            return;
        }

        findAndInsert(currentNode->left, parentData, newNode, isLeft);
        findAndInsert(currentNode->right, parentData, newNode, isLeft);
    }

    Node* removeNode(Node* node, int data) {
        if (node == nullptr)
            return nullptr;

        if (node->data == data) {
            if (node->left != nullptr)
                node->left = removeNode(node->left, node->left->data);
            if (node->right != nullptr)
                node->right = removeNode(node->right, node->right->data);
            delete node;
            return nullptr;
        }

        node->left = removeNode(node->left, data);
        node->right = removeNode(node->right, data);

        return node;
    }
     Node* findNode(Node* node, int data)
     {
        if (node == nullptr)
            return nullptr;

        if (node->data == data)
            return node;

        Node* leftResult = findNode(node->left, data);
        if (leftResult != nullptr)
            return leftResult;

        return findNode(node->right, data);
    }
};
int main() {
    BinaryTree tree;
    int choice;

    do {
        cout << "\nMenu:\n";
        cout << "1. Insert\n";
        cout << "2. Remove\n";
        cout << "3. Search\n";
        cout << "4. Get Height\n";
        cout << "5. Exit\n";
        cout << "Enter your choice: ";
        cin >> choice;

        switch (choice) {
            case 1: {
                int N;
                cout << "Enter the number of nodes: ";
                cin >> N;

                for (int i = 0; i < N; i++) {
                    int data, parentData, childType;
                    cout << "Enter data, parent and child type (1 for left, 2 for right): ";
                    cin >> data >> parentData >> childType;
                    tree.insert(data, parentData, childType);
                }

                cout << "Tree after insertion (preorder traversal):\n";
                tree.preorderTraversal(tree.root);

                break;
            }
            case 2: {
                int removeValue;
                cout << "Enter a node to remove: ";
                cin >> removeValue;
                tree.remove(removeValue);
                break;
            }
            case 3: {
                int searchValue;
                cout << "Enter a node to search for: ";
                cin >> searchValue;
                tree.search(searchValue);
                break;
            }
            case 4: {
                int height = tree.getHeight(tree.root);
                cout << "Height of the tree: " << height << endl;
                break;
            }
            case 5:
                cout << "Exiting... Thank you!\n";
                break;
            default:
                cout << "Invalid choice. Please try again.\n";
        }
    } while (choice != 5);

    return 0;
}
