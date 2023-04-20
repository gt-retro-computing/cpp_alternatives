pub fn linear_search(comptime T: type, arr: []T, key: T) i32 {
    for (arr) |e, i| {
        if (e == key) {
            return @intCast(i32, i);
        }
    }
    return -1;
}

pub fn main() !void {}
