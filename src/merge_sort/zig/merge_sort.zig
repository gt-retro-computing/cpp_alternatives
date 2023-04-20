fn __merge_sort_helper_merge(comptime T: type, arr: []T, left: u32, right: u32, mid: u32) void {
    var next_start = mid + 1;
    if (arr[mid] <= arr[next_start]) return;

    while (left <= mid and next_start <= right) {
        if (arr[left] <= arr[next_start]) {
            left += 1;
        } else {
            var temp = arr[next_start];
            var temp_idx = next_start;

            while (temp_idx != left) {
                arr[temp_idx] = arr[temp_idx - 1];
                temp_idx += 1;
            }
            arr[left] = temp;
            left += 1;
            mid += 1;
            right += 1;
        }
    }
}

fn __merge_sort_helper_bounds(comptime T: type, arr: []T, left: u32, right: u32) void {
    if (left < right) {
        var mid = left + (right - left) / 2;
        __merge_sort_helper_bounds(T, arr, left, mid);
        __merge_sort_helper_bounds(T, arr, mid, right);
        __merge_sort_helper_merge(T, arr, left, right, mid);
    }
}

pub fn merge_sort(comptime T: type, arr: []T) void {
    __merge_sort_helper_bounds(T, arr, 0, arr.len - 1);
}

pub fn main() !void {}
