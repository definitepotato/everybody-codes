const std = @import("std");
const print = std.debug.print;
const file1 = @embedFile("input1.txt");
const file2 = @embedFile("input2.txt");
const file3 = @embedFile("input3.txt");

// Ancient Ant (A): 0
// Badass Beetle (B): 1
// Creepy Cockroach (C): 3
// Diabolical Dragonfly (D): 5

const input1 = "ABBAC";
const input2 = "AxBCDDCAxD";

pub fn main() void {
    var potions_part1: i32 = 0;

    // Part 1: one at a time
    for (file1) |opfor| {
        switch (opfor) {
            65 => continue, // A
            66 => potions_part1 += 1, // B
            67 => potions_part1 += 3, // C
            else => continue,
        }
    }
    print("Part 1: {d}\n", .{potions_part1});

    // Part 2: +2 when 2 monsters pair, x = no monster
    var potions_part2: i32 = 0;
    var idx: usize = 1;
    while (idx < file2.len) : (idx += 2) {
        const left: u8 = file2[idx - 1];
        const right: u8 = file2[idx];

        switch (left) {
            // A
            65 => switch (right) {
                65 => potions_part2 += 2, // A
                66 => potions_part2 += 3, // B
                67 => potions_part2 += 5, // C
                68 => potions_part2 += 7, // D
                120 => potions_part2 += 0, // x
                else => continue,
            },
            // B
            66 => switch (right) {
                65 => potions_part2 += 3, // A
                66 => potions_part2 += 4, // B
                67 => potions_part2 += 6, // C
                68 => potions_part2 += 8, // D
                120 => potions_part2 += 1, // x
                else => continue,
            },
            // C
            67 => switch (right) {
                65 => potions_part2 += 5, // A
                66 => potions_part2 += 6, // B
                67 => potions_part2 += 8, // C
                68 => potions_part2 += 10, // D
                120 => potions_part2 += 3, // x
                else => continue,
            },
            // D
            68 => switch (right) {
                65 => potions_part2 += 7, // A
                66 => potions_part2 += 8, // B
                67 => potions_part2 += 10, // C
                68 => potions_part2 += 12, // D
                120 => potions_part2 += 5, // x
                else => continue,
            },
            // x
            120 => switch (right) {
                65 => potions_part2 += 0, // A
                66 => potions_part2 += 1, // B
                67 => potions_part2 += 3, // C
                68 => potions_part2 += 5, // D
                120 => potions_part2 += 0, // x
                else => continue,
            },
            else => continue,
        }

        // print("[DEBUG] {d}: {c} {c}\n", .{ idx, left, right });
    }
    print("Part 2: {d}\n", .{potions_part2});

    // Part 3: 3 at a time
}
