//
//  Day.swift
//  AdventOfCode
//
//  Created by Jan Hamza on 29.03.2025.
//

protocol Day {
    var day: String { get }
    var input: String { get }
    
    func printSolution() -> Void
    func solvePartOne() -> Int
    func solvePartTwo() -> Int
}
