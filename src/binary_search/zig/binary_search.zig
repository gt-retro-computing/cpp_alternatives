pub fn binary_search(comptime T: type, arr: []T, key: T) i32 {
    var left: u32 = 0;
    var right: u32 = @intCast(u32, arr.len);
    if (arr.len == 1) {
        if (arr[0] == key) return @intCast(i32, 0);
        return -1;
    }
    while (left < right) {
        var mid = (left + right) / 2;
        if (arr[mid] == key) return @intCast(i32, mid);
        if (arr[mid] < key) left = mid;
        if (arr[mid] > key) right = mid;
    }
    return -1;
}

pub fn main() !void {}

const assert = @import("std").debug.assert;

test "Empty List" {
    var arr = [_]u32{};
    assert(binary_search(u32, &arr, 1) == -1);
}

test "Element present in List" {
    var arr = [_]u32{ 1, 3, 5, 7 };
    assert(binary_search(u32, &arr, 3) == 1);
}

test "Element present at the end of the list" {
    var arr = [_]u32{ 1, 3, 5, 7, 9, 10 };
    assert(binary_search(u32, &arr, 10) == 5);
}

test "Element present in list with one element" {
    var arr = [_]u32{1};
    assert(binary_search(u32, &arr, 1) == 0);
}

test "Element absent in list with one element" {
    var arr = [_]u32{1};
    assert(binary_search(u32, &arr, 3) == -1);
}
test "List with negative numbers and negative key" {
    var arr = [_]i32{ -5, -4, -2, 0, 3, 5, 12 };
    assert(binary_search(i32, &arr, -2) == 2);
}
test "List with negative numbers and positive key" {
    var arr = [_]i32{ -5, -4, -2, 0, 3, 5, 12 };
    assert(binary_search(i32, &arr, 3) == 4);
}
