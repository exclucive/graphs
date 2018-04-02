//: Playground - noun: a place where people can play

import UIKit

func == <T:Equatable> (tuple1:(T,T),tuple2:(T,T)) -> Bool {
    return (tuple1.0 == tuple2.0) && (tuple1.1 == tuple2.1)
}

let lettersMatrix = [["G", "O", "S"], ["A", "A", "E"], ["X", "P", "S"]]

//func traverseMatrix(matrix: [[String]]) {
//    var allWords:[String] = []
//
//    for i in 0..<lettersMatrix.count {
//        for j in 0..<lettersMatrix[i].count {
//
//        }
//    }
//}
//
//
///// i - row
///// j - column
//
//func findChildrenOf(i: Int, j: Int) {
//}

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


func dfs(i: Int, j: Int, visited: inout [(i: Int, j: Int)]) -> String {
    var str = lettersMatrix[i][j]
    visited.append((i, j))
    
    let neigbors = neighborgsOf(i: i, j: j)
    for element in neigbors {
        if visited.contains(where: {$0 == element}) ==  false {
            str += dfs(i: element.i, j: element.j, visited: &visited)
        }
    }
    
    return str
}

var visited: [(i: Int, j: Int)] = []
let str = dfs(i: 0, j: 0, visited: &visited)

//let neigbors = neighborgsOf(i: 0, j: 2)




//func depthFirstSearch(_ graph: Graph, source: Node) -> [String] {
//    var nodesExplored = [source.label]
//    source.visited = true
//
//    for edge in source.neighbors {
//        if !edge.neighbor.visited {
//            nodesExplored += depthFirstSearch(graph, source: edge.neighbor)
//        }
//    }
//    return nodesExplored
//}


/*
['G', 'O', 'S']
['A', 'A', 'E']
['X', 'P', 'S']
*/
