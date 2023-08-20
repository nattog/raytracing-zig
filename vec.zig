const std = @import("std");

pub const Vec3 = struct {
    x: f64 = 0,
    y: f64 = 0,
    z: f64 = 0,

    pub fn print(self: *Vec3) void {
        std.debug.print("{d}, {d}, {d}\n", .{ self.x, self.y, self.z });
    }

    pub fn add(self: *Vec3, e: *Vec3) void {
        self.x += e.x;
        self.y += e.y;
        self.z += e.z;
    }

    pub fn multiply(self: *Vec3, t: f64) void {
        self.x *= t;
        self.y *= t;
        self.z *= t;
    }

    pub fn divide(self: *Vec3, t: f64) void {
        self.multiply(1 / t);
    }

    pub fn length(self: *Vec3) f64 {
        return std.math.sqrt(self.length_squared());
    }

    pub fn length_squared(self: *Vec3) f64 {
        return self.x * self.x + self.y * self.y + self.z * self.z;
    }
};
