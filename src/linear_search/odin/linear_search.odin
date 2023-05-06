package main
import "core:fmt"

linear_search::proc(arr: [dynamic]int, key: int) -> int {
    for val, i in arr {
        if val == key {
            return i;
        }
    }
    return -1;
}


assertAndPrint :: proc (testName: string, testNumber: int, expression: bool) {
    fmt.printf("Test %d: %s -> %s\n", testNumber, testName, expression ? "Passed" : "Failed")
    
}

main :: proc () {
    assertAndPrint("Empty List", 1, linear_search({}, 1) == -1)
    assertAndPrint("Element present in List", 2, linear_search({ 1, 3, 5, 7 }, 3) == 1)
    assertAndPrint("Element present at the end of the list", 3, linear_search({ 1, 3, 5, 7, 9, 10 }, 10) == 5)
    assertAndPrint("Element present in list with one element", 4, linear_search({1}, 1) == 0)
    assertAndPrint("Element absent in list with one element", 5, linear_search({1}, 3) == -1)
    assertAndPrint("List with negative numbers and negative key", 6, linear_search({ -5, -4, -2, 0, 3, 5, 12 }, -2) == 2)
    assertAndPrint("List with negative numbers and positive key", 7, linear_search({ -5, -4, -2, 0, 3, 5, 12 }, 3) == 4)
}
