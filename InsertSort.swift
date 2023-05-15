import Foundation

// Insertion sort
func insertionSort(_ array: inout [Int]) {
    let n = array.count
    for i in 1..<n {
        let currentNum = array[i]
        var j = i - 1
        while j >= 0 && array[j] > currentNum {
            array[j + 1] = array[j]
            j -= 1
        }
        array[j + 1] = currentNum
    }
}

// Main function
func readAndSortFile(inputFileName: String, outputFileName: String) {
    do {
        // Create input and output
        let inputURL = URL(fileURLWithPath: inputFileName)
        let outputURL = URL(fileURLWithPath: outputFileName)
        
        // Read the input file
        let input = try String(contentsOf: inputURL)
        
        // Split input into lines
        let lines = input.split(separator: "\n")
        
        var output = ""
        
        for (lineIndex, line) in lines.enumerated() {
            // Split line by spaces
            let numbers = line.split(separator: " ")
            
            var array = [Int]()
            var hasInvalidInput = false
            
            for number in numbers {
                // Convert each number to an integer
                if let num = Int(number) {

                    // Add to array
                    array.append(num)
                } else {
                    // Invalid input
                    hasInvalidInput = true
                    output += "Invalid input at line \(lineIndex + 1)\n"
                    break
                }
            }
            
            if !hasInvalidInput {
                // function call
                insertionSort(&array)
                
                // Add the sorted array to the string
                output += "\(array)\n"
            }
        }
        
        // Display output
        try output.write(to: outputURL, atomically: true, encoding: .utf8)
    } catch {
        // Display error
        print("Error: \(error.localizedDescription)")
    }
}

// Create input/output file.
let inputFileName = "input.txt"
let outputFileName = "output.txt"

// Call main function
readAndSortFile(inputFileName: inputFileName, outputFileName: outputFileName)
