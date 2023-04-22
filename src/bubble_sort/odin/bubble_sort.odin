package main

bubble_sort :: proc ($T: typeid, arr: [dynamic]T) {
    for i := 0; i < len(arr); i+=1 {
        for j := 0; j < len(arr) - i - 1; j += 1 {
            if arr[j] > arr[j+1] {
                temp := arr[j]
                arr[j] = arr[j+1]
                arr[j+1] = temp
            }
        }
    }
}

main :: proc () {}