#include <stdio.h>
#include <string>
#include <string.h>
#include <cstring>
template <typename T>
int linear_search(T arr[], T key, int length) {
    for (int i = 0; i < length; i++) {
        if (arr[i] == key) return i;
    }
    return -1;
}

// void assertAndPrint(std::string testName, int testNumber, bool expression) {
//     printf(
//             "Test %d: 'compiler complained about cstrings' -> %d\n", testNumber, expression
//         );
// }

void assertAndPrint(int testNumber, bool expression) {
    printf(
            "Test %d: 'compiler complained about cstrings' -> %d\n", testNumber, expression
        );
}

int main() {
        // int input1Arr[0] = {};
        // assertAndPrint("Empty List", 1, linear_search(input1Arr, 0, 2) == -1);

        // int input2Arr[] = {1, 3, 5, 7};
        // assertAndPrint("Element present in List", 2, linear_search(input2Arr, 3, 4) == 1);      

        // int input3Arr[] = {1};
        // assertAndPrint("Element present in list with one Element", 3, linear_search(input3Arr, 1, 1) == 0);

        // int input4Arr[] = {1};
        // assertAndPrint("Element absent in list with one element", 4, linear_search(input4Arr, 3, 1) == -1);

        // int input5Arr[] = {1, 3, 5, 7, 9, 10};
        // assertAndPrint("Element present at the end of the list", 5, linear_search(input5Arr, 10, 6) == 5);

        // int input6Arr[] = {-5, -4, -2, 0, 3, 5, 12};
        // assertAndPrint("List with negative numbers and negative key", 6, linear_search(input6Arr, -2, 7) == 2);

        // int input7Arr[] = {-5, -4, -2, 0, 3, 5, 12};
        // assertAndPrint("List with negative numbers and positive key", 7, linear_search(input7Arr, 3, 7) == 4);

        int input2Arr[] = {1, 3, 5, 7};
        assertAndPrint(2, linear_search(input2Arr, 3, 4) == 1);      

        int input3Arr[] = {1};
        assertAndPrint(3, linear_search(input3Arr, 1, 1) == 0);

        int input4Arr[] = {1};
        assertAndPrint(4, linear_search(input4Arr, 3, 1) == -1);

        int input5Arr[] = {1, 3, 5, 7, 9, 10};
        assertAndPrint(5, linear_search(input5Arr, 10, 6) == 5);

        int input6Arr[] = {-5, -4, -2, 0, 3, 5, 12};
        assertAndPrint(6, linear_search(input6Arr, -2, 7) == 2);

        int input7Arr[] = {-5, -4, -2, 0, 3, 5, 12};
        assertAndPrint(7, linear_search(input7Arr, 3, 7) == 4);
    return 0;
}