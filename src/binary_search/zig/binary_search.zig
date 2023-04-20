pub fn binary(comptime T: type, arr: []T, key: T) i32 {
    var left: u32 = 0;
    var right: u32 = @intCast(u32, arr.len);
    while (left < right) {
        var mid = (left + right) / 2;
        if (arr[mid] == key) return mid;
        if (arr[mid] < key) left = mid;
        if (arr[mid] > key) right = mid;
    }
    return -1;
}

pub fn main() !void {}
