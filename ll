#include <iostream>
using namespace std;

class Node {
public:
    int data;
    Node* next;
    Node(int val) {
        data = val;
        next = NULL;
    }
};

class List {
    Node* head;
    Node* tail;
public:
    List() {
        head = tail = NULL;
    }

    void push_front(int val) {
        Node* newNode = new Node(val);
        if (!head)
            head = tail = newNode;
        else {
            newNode->next = head;
            head = newNode;
        }
    }

    void push_back(int val) {
        Node* newNode = new Node(val);
        if (!head)
            head = tail = newNode;
        else {
            tail->next = newNode;
            tail = newNode;
        }
    }

    void pop_front() {
        if (!head) {
            cout << "List is empty\n";
            return;
        }
        Node* temp = head;
        head = head->next;
        delete temp;
        if (!head)
            tail = NULL;
    }

    void pop_back() {
        if (!head) {
            cout << "List is empty\n";
            return;
        }
        if (head == tail) {
            delete head;
            head = tail = NULL;
            return;
        }
        Node* temp = head;
        while (temp->next != tail)
            temp = temp->next;
        delete tail;
        tail = temp;
        tail->next = NULL;
    }

    void printLL() {
        if (!head) {
            cout << "List is empty\n";
            return;
        }
        Node* temp = head;
        while (temp) {
            cout << temp->data << " -> ";
            temp = temp->next;
        }
        cout << "NULL\n";
    }
};

int main() {
    List ll;
    int n, val;
    cout << "Enter number of elements: ";
    cin >> n;
    for (int i = 0; i < n; i++) {
        cout << "Enter element " << i + 1 << ": ";
        cin >> val;
        ll.push_back(val);
    }
    cout << "Original list:\n";
    ll.printLL();

    cout << "Deleting front...\n";
    ll.pop_front();
    ll.printLL();

    cout << "Deleting back...\n";
    ll.pop_back();
    ll.printLL();

    return 0;
}
