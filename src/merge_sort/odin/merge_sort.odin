package main

__merge_sort_helper_bounds :: proc ($T : typeid, arr : [dynamic]T, left: u32, right: u32) {
    if left < right {
        mid := left + (right - left) / 2
        __merge_sort_helper_bounds(T, arr, left, mid);
        __merge_sort_helper_bounds(T, arr, mid, right);
        __merge_sort_helper_merge(T, arr, left, right, mid);
    }
}

__merge_sort_helper_merge :: proc ($T : typeid, arr : [dynamic]T, left: u32, right: u32, mid: u32) {
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
                temp_idx += 1
            }
            arr[left] = temp
            left += 1
            mid += 1
            right += 1
        }
    }
}

merge_sort :: proc ($T : typeid, arr : [dynamic]T) {
    __merge_sort_helper_bounds(T, arr, 0, len(arr) - 1)
}

main :: proc () {}