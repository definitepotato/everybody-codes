const std = @import("std");
const print = std.debug.print;
const assert = std.debug.assert;
const file = @embedFile("input2.txt");

const input =
    \\3
    \\4
    \\7
    \\8
;

fn findSmallest(list: std.ArrayList(usize)) usize {
    var smallest: usize = 100;

    for (list.items) |nail| {
        if (smallest > nail) {
            smallest = nail;
        }
    }

    return smallest;
}

test "find smallest" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var list = std.ArrayList(usize).init(allocator);
    defer list.deinit();

    var nails = std.mem.tokenizeAny(u8, input, "\n");
    while (nails.next()) |nail| {
        const nail_height = try std.fmt.parseInt(usize, nail, 10);
        try list.append(nail_height);
    }

    const smallest = findSmallest(list);
    assert(smallest == 3);
}

fn solvePartOne(list: std.ArrayList(usize), smallest: usize) usize {
    var result: usize = 0;

    for (list.items) |nail| {
        result += nail - smallest;
    }

    return result;
}

test "solve part 1" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var list = std.ArrayList(usize).init(allocator);
    defer list.deinit();

    var nails = std.mem.tokenizeAny(u8, input, "\n");
    while (nails.next()) |nail| {
        const nail_height = try std.fmt.parseInt(usize, nail, 10);
        try list.append(nail_height);
    }

    const smallest = findSmallest(list);
    const ans = solvePartOne(list, smallest);
    assert(ans == 10);
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var list = std.ArrayList(usize).init(allocator);
    defer list.deinit();

    var nails = std.mem.tokenizeAny(u8, file, "\n");
    while (nails.next()) |nail| {
        const nail_height = try std.fmt.parseInt(usize, nail, 10);
        try list.append(nail_height);
    }

    const smallest = findSmallest(list);
    const ans = solvePartOne(list, smallest);
    print("Part 1: {d}\n", .{ans});
}
