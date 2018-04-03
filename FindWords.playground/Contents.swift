//: Playground - noun: a place where people can play

import UIKit

func == <T:Equatable> (tuple1:(T,T),tuple2:(T,T)) -> Bool {
    return (tuple1.0 == tuple2.0) && (tuple1.1 == tuple2.1)
}

//let lettersMatrix = [["G", "O", "S"], ["A", "A", "E"], ["X", "P", "S"]]
let lettersMatrix = [["a", "b"], ["c", "d"]]

func isIndexesCorrect(_ i: Int, _ j: Int) -> Bool {
    if i >= 0 && i < lettersMatrix.count && j >= 0 && j < lettersMatrix[i].count {
        return true
    }
    
    return false
}

func addNeighborgIfExist(array: inout [(i: Int, j: Int)], i: Int, j: Int) {
    if isIndexesCorrect(i, j) {
        array.append((i: i, j: j))
    }
}

func neighborgsOf(i: Int, j: Int) -> [(i: Int, j: Int)] {
    var neighborgs:[(i: Int, j: Int)] = []
    
    // top
    addNeighborgIfExist(array: &neighborgs, i: i-1, j: j-1)
    addNeighborgIfExist(array: &neighborgs, i: i-1, j: j)
    addNeighborgIfExist(array: &neighborgs, i: i-1, j: j+1)
    
    // middle
    addNeighborgIfExist(array: &neighborgs, i: i, j: j-1)
    addNeighborgIfExist(array: &neighborgs, i: i, j: j+1)
    
    // bottom
    addNeighborgIfExist(array: &neighborgs, i: i+1, j: j-1)
    addNeighborgIfExist(array: &neighborgs, i: i+1, j: j)
    addNeighborgIfExist(array: &neighborgs, i: i+1, j: j+1)
    
    return neighborgs
}

func dfs(i: Int, j: Int,
         visited: inout [[Bool]],
         words: inout [String: String],
         str: inout String) {
    str = str + lettersMatrix[i][j]
    visited[i][j] = true
    
    let neigbors = neighborgsOf(i: i, j: j)
    for element in neigbors {
        if visited[element.i][element.j] == false {
            dfs(i: element.i, j: element.j, visited: &visited, words: &words, str: &str)
            if str.count > 1 {
                words[str] = str
            }
        }
    }
    
    str.removeLast()
    visited[i][j] = false
}

func findAllCombinations() -> [String: String] {
    var words:[String: String] = [:]
    var visited = [[false, false], [false, false]]
    var str = ""
    
    for i in 0..<lettersMatrix.count {
        for j in 0..<lettersMatrix[i].count {
            dfs(i: i, j: j, visited: &visited, words: &words, str: &str)
        }
    }
    
    return words
}


let allCombinations = findAllCombinations()
print("number of combinations: \(allCombinations.count)")
print("combinations: \n \(allCombinations.values)")

/*
['G', 'O', 'S']
['A', 'A', 'E']
['X', 'P', 'S']
*/



/*
 a  b
 c  d
 */

/*
 ab, ad, ac * 4
 abc, abd, adb, adc, acb, acd * 4
 */



