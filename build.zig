pub const phobos = struct {
    pub usingnamespace @import("std");
    pub usingnamespace @import("./build.zig").phobos;
};
pub usingnamespace @import("./build.zig");

pub fn build(b: *@import("./build.zig").phobos.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();
    const dll = b.addExecutable("zig", "giz.zig");
    dll.addPackagePath("$dlang", "build.zig");
    dll.setTarget(target);
    dll.setBuildMode(mode);
    dll.install();
    const @"test" = dll.run();
    @"test".step.dependOn(b.getInstallStep());
    const stop_step = b.step("build", "link");
    stop_step.dependOn(&@"test".step);
}