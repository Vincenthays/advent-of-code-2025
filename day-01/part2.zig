const std = @import("std");
const input = @embedFile("src/bin/input.txt");

pub fn main() !void {
    var it = std.mem.splitAny(u8, input, "\n");
    var cur: i32 = 50;
    var count: u32 = 0;

    while (it.next()) |line| {
        const is_plus = line[0] == 'R';
        const delta = try std.fmt.parseInt(usize, line[1..], 10);

        for (0..delta) |_| {
            if (is_plus) cur += 1 else cur -= 1;
            if (cur > 100) cur -= 100;
            if (cur < 0) cur += 100;
            if (cur == 100) cur = 0;
            if (cur == 0) count += 1;
        }
    }

    std.debug.print("Count: {any}\n", .{count});
}
