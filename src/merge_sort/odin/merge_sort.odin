package main
import "core:fmt"

__merge_sort_helper_bounds :: proc (arr : [dynamic]int, left: int, right: int) {
    left := left
    right := right
    if left < right {
        mid := left + (right - left) / 2
        __merge_sort_helper_bounds(arr, left, mid);
        __merge_sort_helper_bounds(arr, mid, right);
        __merge_sort_helper_merge(arr, left, right, mid);
    }
}

__merge_sort_helper_merge :: proc (arr : [dynamic]int, left: int, right: int, mid: int) {
    left := left
    right := right
    mid := mid
    next_start := mid + 1
    if arr[mid] <= arr[next_start] {
        return;
    }
    for left < mid && next_start <= right {
        if arr[left] <= arr[next_start] {
            left += 1
        } else {
            temp := arr[next_start]
            temp_idx := next_start

            for temp_idx != left {
                arr[temp_idx] = arr[temp_idx - 1]
                temp_idx -= 1
            }
            arr[left] = temp
            left += 1
            mid += 1
            next_start += 1
        }
    }
}

merge_sort :: proc (arr : [dynamic]int) -> [dynamic]int {
    __merge_sort_helper_bounds(arr, 0, len(arr) - 1)
    return arr
}



assertAndPrint :: proc (testName: string, testNumber: int, expression: bool) {
    fmt.printf("Test %d: %s -> %s\n", testNumber, testName, expression ? "Passed" : "Failed")
}

arrEquals :: proc (arr1: [dynamic]int, arr2: [dynamic]int) -> bool {
    if len(arr1) != len(arr2) {return false;}
    for i := 0; i < len(arr1); i+= 1 {
        if arr1[i] != arr2[i] {return false;}
    }
    return true;
}

main :: proc () {
    assertAndPrint("Empty Array", 1, arrEquals(merge_sort({}), {}));
    assertAndPrint("Sorted Array", 2, arrEquals(merge_sort({0, 1, 3, 5, 6, 7, 8}), {0, 1, 3, 5, 6, 7, 8}));
    assertAndPrint("One element array", 3, arrEquals(merge_sort({1}), {1}));
    assertAndPrint("Random Array", 4, arrEquals(merge_sort({6, 1, 9, -4, 7, 32, -6}), {-6, -4, 1, 6, 7, 9, 32}));
    assertAndPrint("Array with repetition", 5, arrEquals(merge_sort({7, 2, -4, 2, 23, 2, 2, 6}), {-4, 2, 2, 2, 2, 6, 7, 23}));
}