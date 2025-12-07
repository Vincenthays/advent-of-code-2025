const std = @import("std");
const input = @embedFile("input.txt");

pub fn main() !void {
    var sum: usize = 0;
    var it = std.mem.splitAny(u8, input, "-,");

    while (it.next()) |line| {
        if (line.len == 0) continue;
        const start = try std.fmt.parseInt(usize, line, 10);
        const end = try std.fmt.parseInt(usize, it.next() orelse unreachable, 10);

        for (start..end + 1) |i| {
            const nb_digits = count_digits(i);
            if (nb_digits % 2 > 0) continue;
            const cut = std.math.pow(usize, 10, nb_digits / 2);
            if (i / cut == i % cut) sum += i;
        }
    }
    std.debug.print("Sum: {d}\n", .{sum});
}

fn count_digits(n: usize) usize {
    if (n == 0) return 1;
    var count: usize = 0;
    var temp = n;
    while (temp > 0) : (temp /= 10) {
        count += 1;
    }
    return count;
}
