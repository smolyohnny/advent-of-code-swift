//
//  Day02.swift
//  AdventOfCode
//
//  Created by Jan Hamza on 30.03.2025.
//

struct Day02: Day {
    
    var day: String = "02"
    
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

extension Day02 {
    
    func splitInputByLine() -> [String] {
        return input.components(separatedBy: "\n").dropLast()
    }
    
    func parseInput(lines: [String]) -> [[Int]] {
        var result: [[Int]] = []
        
        for line in lines {
            result.append(line.split(separator: " ").map { Int($0) ?? -1 })
        }
        return result
    }
    
    func isAscending(_ row: [Int]) -> Bool {
        for (value, nextValue) in zip(row.dropLast(), row.dropFirst()) {
            if (value >= nextValue) || (nextValue-value > 3) {
                return false
            }
        }
        return true
    }
    
    func isDescending(_ row: [Int]) -> Bool {
        for (value, nextValue) in zip(row.dropLast(), row.dropFirst()) {
            if value <= nextValue || (value-nextValue > 3){
                return false
            }
        }
        return true
    }
}


// MARK: - Part 1 methods

extension Day02 {
    func solvePartOne() -> Int {
        
        var safeReports = 0
        let data = parseInput(lines: splitInputByLine())
        
        for row in data {
            if isAscending(row) || isDescending(row) {
                safeReports += 1
            }
        }
        
        return safeReports
    }
    
}


// MARK: - Part 2 methods

extension Day02 {
    func solvePartTwo() -> Int {
        
        var safeReports = 0
        let data = parseInput(lines: splitInputByLine())
        
        for row in data {
            if isAscending(row) || isDescending(row) {
                safeReports += 1
            } else {
                for (offset, _) in row.enumerated() {
                    let changedRow = row.enumerated().filter { $0.offset != offset }.map { $0.element }
                    
                    if isAscending(changedRow) || isDescending(changedRow) {
                        safeReports += 1
                        break
                    }
                }
            }
            
        }
        
        return safeReports
    }

}

