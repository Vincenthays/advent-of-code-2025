const std = @import("std");
const input = @embedFile("src/bin/input.txt");

pub fn main() !void {
    var it = std.mem.splitAny(u8, input, "\n");
    var cur: i32 = 50;
    var count: u32 = 0;

    while (it.next()) |line| {
        const is_plus = line[0] == 'R';
        const delta = try std.fmt.parseInt(i32, line[1..], 10);
        cur = if (is_plus) @mod(cur + delta, 100) else @mod(cur + 99 * delta, 100);
        if (cur == 0) count += 1;
    }

    std.debug.print("Count: {any}\n", .{count});
}
