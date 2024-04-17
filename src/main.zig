const std = @import("std");
const Fluent = @import("fluent");

pub fn main() !void {
    const str_a: []const u8 = "    hello,";
    const str_b: []const u8 = " world!   ";
    var buf: [64]u8 = undefined;

    const result = Fluent.init(str_a) // initialize our interface on str_a
        .concat(str_b, buf[0..]) // concatenate str_b into buffer
        .trim(.periphery, .scalar, ' ') // trim spaces on both sides
        .title(); // python title function

    _ = result.print("result: {s}\n");
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
