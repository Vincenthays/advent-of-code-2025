const std = @import("std");
const input = @embedFile("input.txt");

pub fn main() !void {
    var it = std.mem.splitAny(u8, input, ",");

    while (it.next()) |range| {
        std.debug.print("{any}", .{range});
    }
}
