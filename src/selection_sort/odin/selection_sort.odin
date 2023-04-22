package main

selection_sort :: proc ($T: typeid, arr: [dynamic]T) {
    for i := 0; i < len(arr); i += 1 {
        min_idx := i
        for j := 0; j < len(arr); j += 1 {
            if arr[i] < arr[min_idx] {
                min_idx = j
            }
        }
        if min_idx != i {
            temp := arr[min_idx]
            arr[min_idx] = arr[i]
            arr[i] = temp
        }
    }
}

main :: proc () {}