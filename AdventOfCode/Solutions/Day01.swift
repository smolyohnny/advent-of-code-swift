//
//  Day01.swift
//  AdventOfCode
//
//  Created by Jan Hamza on 30.03.2025.
//

struct Day01: Day {
    
    var day: String = "01"
    
    var input: [String] = []
    
    init() {
        do {
            try loadInput()
        } catch {
            print("Error loading input: \(error)")
        }
    }
    
    mutating func loadInput() throws {
        input = try Utils.getInputForDay(day)
    }
    
    func printSolution() {
        print("Day \(day)\n \(solvePartOne())\n \(solvePartTwo())\n")
    }
    
}

// MARK: - Shared methods

extension Day01 {
    
    func parseInputTouple() -> ([Int], [Int]) {
        let leftColumn = input.map { Int($0.components(separatedBy: .whitespaces).first ?? "") ?? -1}
        let rightColumn = input.map { Int($0.components(separatedBy: .whitespaces).last ?? "") ?? -1}
        return (leftColumn, rightColumn)
    }
    
}

// MARK: - Part 1 methods

extension Day01 {
    func solvePartOne() -> Int{
        
        var totalDistance = 0
        var (left, right) = parseInputTouple()
        
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
        let (left, right) = parseInputTouple()
        
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
