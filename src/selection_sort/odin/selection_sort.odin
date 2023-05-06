package main
import "core:fmt"

selection_sort :: proc (arr: [dynamic]int) -> [dynamic] int{
    for i := 0; i < len(arr); i += 1 {
        min_idx := i
        for j := i + 1; j < len(arr); j += 1 {
            if arr[min_idx] > arr[j] {
                min_idx = j
            }
        }
        if min_idx != i {
            temp := arr[min_idx]
            arr[min_idx] = arr[i]
            arr[i] = temp
        }
    }
    return arr;
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
    assertAndPrint("Empty Array", 1, arrEquals(selection_sort({}), {}));
    assertAndPrint("Sorted Array", 2, arrEquals(selection_sort({0, 1, 3, 5, 6, 7, 8}), {0, 1, 3, 5, 6, 7, 8}));
    assertAndPrint("One element array", 3, arrEquals(selection_sort({1}), {1}));
    assertAndPrint("Random Array", 4, arrEquals(selection_sort({6, 1, 9, -4, 7, 32, -6}), {-6, -4, 1, 6, 7, 9, 32}));
    assertAndPrint("Array with repetition", 5, arrEquals(selection_sort({7, 2, -4, 2, 23, 2, 2, 6}), {-4, 2, 2, 2, 2, 6, 7, 23}));
    
}