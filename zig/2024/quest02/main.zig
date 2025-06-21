const std = @import("std");
const print = std.debug.print;
const file1 = @embedFile("input1.txt");

const input1 = "AWAKEN THE POWER ADORNED WITH THE FLAMES BRIGHT IRE";

const words1 = [_][]const u8{
    "LOR",
    "LL",
    "SI",
    "OR",
    "CU",
    "UR",
    "AD",
};

pub fn main() void {
    var cursor: usize = 0;
    var runic_words_count: usize = 0;

    for (words1) |word| {
        // print("[DEBUG] Current Word: {s}\n", .{word});
        for (0..file1.len) |_| {
            if (cursor + word.len > file1.len) {
                break;
            }

            const window = file1[cursor .. cursor + word.len]; // read in chars at a time equal to len of word

            if (std.mem.eql(u8, window, word)) {
                // print("[DEBUG] Matched: {s}:{s}\n", .{ window, word });
                runic_words_count += 1;
            }

            // print("[DEBUG] Window: {s}\n", .{window});
            cursor += 1; // move the cursor one char before looping around
        }
        // print("[DEBUG] {s}: {d}\n", .{ word, word });

        cursor = 0; // reset the cursor at the end of each word

    }

    print("Part 1: {d}\n", .{runic_words_count});
}
