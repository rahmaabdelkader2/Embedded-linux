#include <stdio.h> // Ensure this header is included

// Function to implement binary search
int binary_search(int arr[], int size, int target) {
    int low = 0, high = size - 1;

    while (low <= high) {
        int mid = low + (high - low) / 2; // Avoid overflow

        if (arr[mid] == target) {
            return mid; // Element found
        } else if (arr[mid] < target) {
            low = mid + 1; // Search in the right half
        } else {
            high = mid - 1; // Search in the left half
        }
    }

    return -1; // Element not found
}

int main() {
    // Declare and initialize an array
    int arr[] = {2, 4, 6, 8, 10, 12, 14};
    int size = sizeof(arr) / sizeof(arr[0]); // Calculate size of the array
    int target; // Target element to search

    // Prompt the user to enter the target element
    printf("Enter the element to search: ");
    scanf("%d", &target);

    // Call the binary search function
    int result = binary_search(arr, size, target);

    // Print the result
    if (result != -1) {
        printf("Element found at index: %d\n", result);
    } else {
        printf("Element not found\n");
    }

    return 0;
}

