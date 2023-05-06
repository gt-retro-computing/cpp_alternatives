package main
import "core:fmt"

binary_search :: proc (arr: [dynamic]int, key: int) -> int {
    left := 0
    right := len(arr)
    if len(arr) == 1 {
        return arr[0] == key ? 0 : -1
    }
    for left < right {
        mid := (left + right) / 2
        if arr[mid] < key {
            left = mid
        } else if arr[mid] > key {
            right = mid
        } else {
            return mid
        }
    }
    return -1
}

assertAndPrint :: proc (testName: string, testNumber: int, expression: bool) {
    fmt.printf("Test %d: %s -> %s\n", testNumber, testName, expression ? "Passed" : "Failed")
    
}

main :: proc () {
    assertAndPrint("Empty List", 1, binary_search({}, 1) == -1)
    assertAndPrint("Element present in List", 2, binary_search({ 1, 3, 5, 7 }, 3) == 1)
    assertAndPrint("Element present at the end of the list", 3, binary_search({ 1, 3, 5, 7, 9, 10 }, 10) == 5)
    assertAndPrint("Element present in list with one element", 4, binary_search({1}, 1) == 0)
    assertAndPrint("Element absent in list with one element", 5, binary_search({1}, 3) == -1)
    assertAndPrint("List with negative numbers and negative key", 6, binary_search({ -5, -4, -2, 0, 3, 5, 12 }, -2) == 2)
    assertAndPrint("List with negative numbers and positive key", 7, binary_search({ -5, -4, -2, 0, 3, 5, 12 }, 3) == 4)
}
