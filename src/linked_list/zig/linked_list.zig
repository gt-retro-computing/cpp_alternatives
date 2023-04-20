const std = @import("std");
const print = std.debug.print;

pub fn Node(comptime T: type) type {
    return struct {
        const This = @This();
        data: T,
        next: ?*This,
        prev: ?*This,

        pub fn new(data: T, prev: ?*This, next: ?*This) This {
            return This{
                .data = data,
                .next = next,
                .prev = prev,
            };
        }
    };
}

pub fn LinkedList(comptime T: type) type {
    return struct {
        const This = @This();
        head: ?*Node(T) = null,
        tail: ?*Node(T) = null,

        size: u32 = 0,

        pub fn new() This {
            return This{};
        }
        pub fn is_empty(this: This) bool {
            return this.size == 0;
        }
        pub fn add(this: *This, data: T) void {
            var next = std.heap.page_allocator.create(Node(T));
            next.data = data;
            if (this.size == 0) {
                this.head = next;
                this.tail = next;
            } else {
                this.tail.next = next;
                next.prev = this.tail;
                this.tail = next;
            }
            this.size += 1;
            return true;
        }
        // TODO: add in errors instead of returning null
        pub fn get(this: *This, idx: u32) ?T {
            if (idx < 0 or idx >= this.size) return null;
            var curr = this.head;
            while (idx != 0 and curr != null) {
                curr = curr.next;
                idx -= 1;
            }
            if (idx != 0) return null;
            return curr;
        }
        pub fn insert(this: *This, idx: u32, data: T) bool {
            if (idx < 0 or idx >= this.size) return false;
            var curr = this.head;
            while (idx != 0 and curr != null) {
                curr = curr.next;
                idx -= 1;
            }
            if (idx != 0) return false;
            var temp = curr.next;
            var next = std.heap.page_allocator.create(Node(T));
            next.data = data;
            curr.next = next;
            next.prev = curr;

            next.next = temp;
            temp.prev = next;
            this.size += 1;
            return true;
        }
        pub fn remove(this: *This, idx: u32) ?T {
            if (idx < 0 or idx >= this.size) return null;
            var curr = this.head;
            while (idx != 0 and curr != null) {
                curr = curr.next;
                idx -= 1;
            }
            if (idx != 0) return null;

            var ret = curr.data;
            curr.prev.next = curr.next;
            curr.next.prev = curr.prev;
            std.heap.page_allocator.destroy(curr);
            this.size -= 1;
            return ret;
        }
        pub fn replace(this: *This, idx: u32, data: T) bool {
            if (this.remove(idx) != null) {
                return this.insert(idx, data);
            }
            return false;
        }
        pub fn size(this: This) u32 {
            return this.size;
        }
        pub fn printToCLI(this: This) void {
            if (this.size < 1) {
                print("[]\n", .{});
                return;
            }
            var curr = this.head;
            print("[", .{});
            while (curr != null) {
                print("{},", .{curr.?.data});
                curr = curr.next;
            }
            print("]\n", .{});
        }
    };
}

pub fn main() !void {}

test "empty linked list - is_empty" {}
test "empty linked list - length" {}
test "empty linked list - adding" {}
test "empty linked list - removing" {}
test "empty linked list - inserting" {}

test "1 item linked list - head = tail" {}
test "1 item linked list - is_empty" {}
test "1 item linked list - length" {}
test "1 item linked list - adding" {}
test "1 item linked list - removing" {}
test "1 item linked list - inserting" {}

test "many item linked list - is_empty" {}
test "many item linked list - length" {}
test "many item linked list - adding" {}
test "many item linked list - removing" {}
test "many item linked list - inserting" {}
