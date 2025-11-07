#include <iostream>
using namespace std;

int main() {
    int arr[100];

    cout << "Enter size of array: ";
    int n;
    cin >> n;

    cout << "Enter elements: ";
    for (int i = 0; i < n; i++) {
        cin >> arr[i];
    }

    int choice;
    do {
        cout << "\n1. Insert\n2. Delete\n3. Search\n4. Traverse\n5. Exit\n";
        cout << "Enter your choice: ";
        cin >> choice;

        switch(choice) {
            case 1: { // Insertion
                cout << "Enter position (0 to " << n << "): ";
                int pos;
                cin >> pos;

                cout << "Enter value to insert: ";
                int value;
                cin >> value;

                for (int i = n; i > pos; i--)
                    arr[i] = arr[i - 1];

                arr[pos] = value;
                n++;
                break;
            }

            case 2: { // Deletion
                cout << "Enter position to delete (0 to " << n << "): ";
                int pos;
                cin >> pos;

                for (int i = pos; i < n; i++)
                    arr[i] = arr[i + 1];

                n--;
                break;
            }

            case 3: { // Searching
                cout << "Enter value to search: ";
                int value;
                cin >> value;

                int found = -1;
                for (int i = 0; i < n; i++) {
                    if (arr[i] == value) {
                        found = i;
                        break;
                    }
                }

                if (found != -1)
                    cout << "Element found at index " << found << endl;
                else
                    cout << "Element not found\n";
                break;
            }

            case 4: { // Traversal
                cout << "Array elements: ";
                for (int i = 0; i < n; i++)
                    cout << arr[i] << " ";
                cout << endl;
                break;
            }

            case 5:
                cout << "Exiting...\n";
                break;

            default:
                cout << "Invalid choice\n";
        }
    } while(choice != 5);

    return 0;
}
