const std = @import("std");

pub fn main() !void {
    const image_width: i32 = 256;
    const image_height: i32 = 256;

    const out_file = std.io.getStdOut();

    const writer = out_file.writer();
    try writer.print("P3\n{d} {d}\n255\n", .{ image_width, image_height });

    var i: usize = 0;
    while (i < image_height) {
        const remaining = image_height - i;
        std.log.default.info("Image rows remaining: {d}", .{remaining});
        var j: usize = 0;
        while (j < image_width) {
            const iAsInt = @as(i64, @intCast(i));
            const jAsInt = @as(i64, @intCast(j));
            const iAsDouble = @as(f64, @as(f64, @floatFromInt(iAsInt)));
            const jAsDouble = @as(f64, @as(f64, @floatFromInt(jAsInt)));

            const r = iAsDouble / (image_width - 1);
            const g = jAsDouble / (image_height - 1);
            const b = 0;

            const ir: i32 = @as(i32, @intFromFloat(255.99 * r));
            const ig: i32 = @as(i32, @intFromFloat(255.99 * g));

            try writer.print("{d} {d} {d}\n", .{ ir, ig, b });
            j += 1;
        }
        i += 1;
    }
    std.log.default.info("Done", .{});
}
