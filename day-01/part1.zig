const std = @import("std");
const input = @embedFile("src/bin/input.txt");

pub fn main() !void {
    var it = std.mem.splitAny(u8, input, "\n");
    var cur: i32 = 50;
    var count: u32 = 0;

    while (it.next()) |line| {
        cur += switch (line[0]) {
            'L' => try std.fmt.parseInt(i32, line[1..], 10),
            'R' => -try std.fmt.parseInt(i32, line[1..], 10),
            else => unreachable,
        };

        while (cur < 100) : (cur += 100) {}
        while (cur > 100) : (cur -= 100) {}
        if (cur == 100) cur = 0;
        if (cur == 0) count += 1;
    }

    std.debug.print("Count: {any}\n", .{count});
}
