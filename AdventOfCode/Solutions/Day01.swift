//
//  Day01.swift
//  AdventOfCode
//
//  Created by Jan Hamza on 30.03.2025.
//

struct Day01: Day {
    
    var day: String = "01"
    
    var input: String
    
    init() {
        do {
            input = try Utils.getInputForDay(day)
        } catch {
            print("Error loading input: \(error)")
            input = ""
        }
    }

    
    func printSolution() {
        print("Day \(day)\n \(solvePartOne())\n \(solvePartTwo())\n")
    }
    
}

// MARK: - Shared methods

extension Day01 {
    
    func splitInputByLine() -> [String] {
        return input.components(separatedBy: "\n").dropLast()
    }
    
    func parseInputTouple(lines: [String]) -> ([Int], [Int]) {
        let leftColumn = lines.map { Int($0.components(separatedBy: .whitespaces).first ?? "") ?? -1}
        let rightColumn = lines.map { Int($0.components(separatedBy: .whitespaces).last ?? "") ?? -1}
        return (leftColumn, rightColumn)
    }
    
}

// MARK: - Part 1 methods

extension Day01 {
    func solvePartOne() -> Int{
        
        var totalDistance = 0
        var (left, right) = parseInputTouple(lines: splitInputByLine())
        
        left.sort(by: >)
        right.sort(by: >)
        
        for i in 0..<left.count {
            totalDistance += abs(left[i] - right[i])
        }
        
        return totalDistance
    }
    
}


// MARK: - Part 2 methods

extension Day01 {
    func solvePartTwo() -> Int {
        
        var similarityScore = 0
        let (left, right) = parseInputTouple(lines: splitInputByLine())
        
        for wantedValue in left {
            var appearences = 0
            
            for currentValue in right where currentValue == wantedValue {
                appearences += 1
            }
            
            similarityScore += wantedValue * appearences
        }
        
        return similarityScore
    }
}
