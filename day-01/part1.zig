const std = @import("std");
const input = @embedFile("src/bin/input.txt");

pub fn main() !void {
    var it = std.mem.splitAny(u8, input, "\n");
    var curr: i32 = 50;
    var count: u32 = 0;

    while (it.next()) |line| {
        const delta = switch (line[0]) {
            'L' => try std.fmt.parseInt(i32, line[1..], 10),
            'R' => -try std.fmt.parseInt(i32, line[1..], 10),
            else => unreachable,
        };
        curr += delta;

        while (curr < 100) {
            curr += 100;
        }
        while (curr > 100) {
            curr -= 100;
        }
        if (curr == 100) {
            curr = 0;
        }
        if (curr == 0) {
            count += 1;
        }
    }

    std.debug.print("Count: {any}\n", .{count});
}
