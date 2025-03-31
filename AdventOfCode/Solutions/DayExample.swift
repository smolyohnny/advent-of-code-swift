//
//  DayExample.swift
//  AdventOfCode
//
//  Created by Jan Hamza on 29.03.2025.
//

struct DayExample: Day {
    
    var day: String = "example"
    
    var input: String
    
    init() {
        do {
            input = try Utils.getInputForDay(day)
        } catch {
            print("Failed to read input for day \(day)")
            input = ""
        }
    }
    
    func printSolution() {
        print("Day \(day)\n \(solvePartOne())\n \(solvePartTwo())\n")
    }
    
}


// MARK: - Shared methods

extension DayExample {
    
}


// MARK: - Part 1 methods

extension DayExample {
    func solvePartOne() -> Int {
        
        return 0
    }
}


// MARK: - Part 2 methods

extension DayExample {
    func solvePartTwo() -> Int {
        
        return 0
    }
}
