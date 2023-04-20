pub fn selection(comptime T: type, arr: []T) void {
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
}

pub fn main() !void {}
