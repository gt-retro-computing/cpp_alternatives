package main

binary_search :: proc ($T : typeid, arr: [dynamic]T, key: T) {
    left := 0
    right := len(arr)
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

main :: proc () {}