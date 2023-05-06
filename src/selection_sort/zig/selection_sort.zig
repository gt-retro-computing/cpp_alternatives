pub fn selection_sort(comptime T: type, arr: []T) []T {
    var i: u32 = 0;
    while (i < arr.len) : (i += 1) {
        var min_idx = i;
        var j = i + 1;
        var swap = false;
        while (j < arr.len) : (j += 1) {
            if (arr[j] < arr[min_idx]) {
                min_idx = j;
                swap = true;
            }
        }
        if (swap) {
            var temp = arr[min_idx];
            arr[min_idx] = arr[i];
            arr[i] = temp;
        }
    }
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
    assert(arrEquals(selection_sort(i32, &input), &output));
}
test "Sorted Array" {
    var input = [_]i32{ 0, 1, 3, 5, 6, 7, 8 };
    var output = [_]i32{ 0, 1, 3, 5, 6, 7, 8 };
    assert(arrEquals(selection_sort(i32, &input), &output));
}
test "One element array" {
    var input = [_]i32{1};
    var output = [_]i32{1};
    assert(arrEquals(selection_sort(i32, &input), &output));
}
test "Random Array" {
    var input = [_]i32{ 6, 1, 9, -4, 7, 32, -6 };
    var output = [_]i32{ -6, -4, 1, 6, 7, 9, 32 };
    assert(arrEquals(selection_sort(i32, &input), &output));
}
test "Array with repetition" {
    var input = [_]i32{ 7, 2, -4, 2, 23, 2, 2, 6 };
    var output = [_]i32{ -4, 2, 2, 2, 2, 6, 7, 23 };
    assert(arrEquals(selection_sort(i32, &input), &output));
}
