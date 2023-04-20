pub fn bubble(comptime T: type, arr: []T) void {
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
}

pub fn main() !void {}
