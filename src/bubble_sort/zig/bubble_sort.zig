pub fn bubble_sort(arr: []i32) []i32 {
    var i: u32 = 0;
    while (i < arr.len) : (i += 1) {
        var j: u32 = 0;
        while (j < arr.len - i - 1) : (j += 1) {
            if (arr[j] > arr[j + 1]) {
                var temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
    return arr;
}

const assert = @import("std").debug.assert;

pub fn arrEquals(arr1: []i32, arr2: []i32) bool {
    if (arr1.len != arr2.len) return false;
    var i: u32 = 0;
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
    assert(arrEquals(bubble_sort(&input), &output));
}
test "Sorted Array" {
    var input = [_]i32{ 0, 1, 3, 5, 6, 7, 8 };
    var output = [_]i32{ 0, 1, 3, 5, 6, 7, 8 };
    assert(arrEquals(bubble_sort(&input), &output));
}
test "One element array" {
    var input = [_]i32{1};
    var output = [_]i32{1};
    assert(arrEquals(bubble_sort(&input), &output));
}
test "Random Array" {
    var input = [_]i32{ 6, 1, 9, -4, 7, 32, -6 };
    var output = [_]i32{ -6, -4, 1, 6, 7, 9, 32 };
    assert(arrEquals(bubble_sort(&input), &output));
}
test "Array with repetition" {
    var input = [_]i32{ 7, 2, -4, 2, 23, 2, 2, 6 };
    var output = [_]i32{ -4, 2, 2, 2, 2, 6, 7, 23 };
    assert(arrEquals(bubble_sort(&input), &output));
}
