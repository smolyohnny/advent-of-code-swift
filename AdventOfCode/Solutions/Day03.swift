//
//  Day03.swift
//  AdventOfCode
//
//  Created by Jan Hamza on 30.03.2025.
//

struct Day03: Day {
    
    var day: String = "03"
    
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


// MARK: - Part 1 methods

extension Day03 {
    func solvePartOne() -> Int {
        
        var result = 0
        let pattern = /mul\((\d+),(\d+)\)/
        
        for match in input.matches(of: pattern) {
            result += (Int(String(match.1)) ?? 0) * (Int(String(match.2)) ?? 0)
        }
        
        return result
    }
}


// MARK: - Part 2 methods

extension Day03 {
    func solvePartTwo() -> Int {
       
        var result = 0
        let pattern = /mul\((\d+),(\d+)\)|do\(\)|don't\(\)/

        var isValid = true
        
        for match in input.matches(of: pattern) {
            
            if String(match.0) == "do()" {
                isValid = true
            }
            else if String(match.0) == "don't()" {
                isValid = false
            }
            else if isValid, let num1 = match.1, let num2 = match.2 {
                result += (Int(String(num1)) ?? 0) * (Int(String(num2)) ?? 0)
            }
            
        }
        
        return result
        
    }
}
