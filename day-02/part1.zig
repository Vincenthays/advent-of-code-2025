const std = @import("std");
const input = @embedFile("input.txt");

pub fn main() !void {
    var it = std.mem.splitAny(u8, input, "-,\n");

    while (it.next()) |line| {
        if (line.len == 0) continue;
        const start = try std.fmt.parseInt(u32, line, 10);
        const end = try std.fmt.parseInt(u32, it.next() orelse unreachable, 10);

        for (start..end) |i| {
            std.debug.print("{d}\n", .{i});
        }

        std.debug.print("\n{d} => {d}\n", .{ start, end });
    }
}
