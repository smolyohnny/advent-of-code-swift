//
//  Utilities.swift
//  AdventOfCode
//
//  Created by Jan Hamza on 29.03.2025.
//

import Foundation

enum Utils {
    static func getInputForDay(_ day: String) throws -> [String] {
        let path = "/Users/yohnny/Development/Projects/AdventOfCode/AdventOfCode/Inputs/\(day).txt"
        let file = try String(contentsOfFile: path, encoding: .utf8)
        let lines: [String] = file.components(separatedBy: "\n").dropLast() // Xcode auto adds extra line to txt
        return lines
    }
}
