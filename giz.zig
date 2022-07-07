const phobos = @import("$dlang").phobos;

pub const @"error" = anyerror;

pub fn main() @"error"!void {
    phobos.log.err("Andrew has eaten all your codebase", .{});
}
