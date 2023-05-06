fn __merge_sort_helper_merge(comptime T: type, arr: []T, _left: usize, _right: usize, _mid: usize) void {
    var left = _left;
    var right = _right;
    var mid = _mid;
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
                temp_idx -= 1;
            }
            arr[left] = temp;
            left += 1;
            mid += 1;
            next_start += 1;
        }
    }
}

fn __merge_sort_helper_bounds(comptime T: type, arr: []T, left: usize, right: usize) void {
    if (left < right) {
        var mid = left + (right - left) / 2;
        __merge_sort_helper_bounds(T, arr, left, mid);
        __merge_sort_helper_bounds(T, arr, mid + 1, right);
        __merge_sort_helper_merge(T, arr, left, right, mid);
    }
}

pub fn merge_sort(comptime T: type, arr: []T) []T {
    // zig will panic on overflows
    if (arr.len == 0) return arr;
    __merge_sort_helper_bounds(T, arr, 0, arr.len - 1);
    return arr;
}

const assert = @import("std").debug.assert;

pub fn arrEquals(arr1: []i32, arr2: []i32) bool {
    if (arr1.len != arr2.len) return false;
    var i: usize = 0;
    while (i < arr1.len) : (i += 1) {
        if (arr1[i] != arr2[i]) {
            return false;
        }
    }
    return true;
}

pub fn main() !void {}

test "Empty Array" {
    var input = [_]i32{};
    var output = [_]i32{};
    assert(arrEquals(merge_sort(i32, &input), &output));
}
test "Sorted Array" {
    var input = [_]i32{ 0, 1, 3, 5, 6, 7, 8 };
    var output = [_]i32{ 0, 1, 3, 5, 6, 7, 8 };
    assert(arrEquals(merge_sort(i32, &input), &output));
}
test "One element array" {
    var input = [_]i32{1};
    var output = [_]i32{1};
    assert(arrEquals(merge_sort(i32, &input), &output));
}
test "Random Array" {
    var input = [_]i32{ 6, 1, 9, -4, 7, 32, -6 };
    var output = [_]i32{ -6, -4, 1, 6, 7, 9, 32 };
    assert(arrEquals(merge_sort(i32, &input), &output));
}
test "Array with repetition" {
    var input = [_]i32{ 7, 2, -4, 2, 23, 2, 2, 6 };
    var output = [_]i32{ -4, 2, 2, 2, 2, 6, 7, 23 };
    assert(arrEquals(merge_sort(i32, &input), &output));
}
