//
//  model.swift
//  assign1
//
//  Created by Meisheng Liu on 9/14/21.
//

import Foundation

struct Tile: Equatable {
    var val : Int
    var lastRow = 0, lastCol = 0
    init(v: Int) {
        val = v
    }
    
    static func == (lhs: Tile, rhs: Tile) -> Bool {
        return lhs.val == rhs.val
    }
}

enum Direction {
    case left
    case right
    case up
    case down
}

public func rotate2DInts(input: [[Int]]) ->[[Int]] {
    var newBoard: [[Int]] = Array(repeating: Array(repeating: 0, count: 4), count: 4)
    
    for row in 0..<4 {
        for column in  0..<4 {
            newBoard[column][4 - 1 - row] = input[row][column]
        }
    }
    
    return newBoard
}

public func rotate2D<T>(input: [[T]]) ->[[T]] {
    var newBoard: [[T]] = input
    
    for row in 0..<4 {
        for column in  0..<4 {
            newBoard[column][4 - 1 - row] = input[row][column]
        }
    }
    
    return newBoard
    
}

class Twos {
    var board: [[Tile]]
    
    init() {
        board = Array(repeating: Array(repeating: Tile(v: 0), count: 4), count: 4)
    }
    
    func shiftLeft() {
        for row in 0..<4 {
            for col in 0..<3 {
                let curr = board[row][col]
                let next = board[row][col + 1]
                
                if next.val == curr.val {
                    board[row][col] = Tile(v: next.val + curr.val)
                    board[row][col + 1] = Tile(v: 0)
                } else if curr.val == 0 && next.val != 0 {
                    board[row][col] = next
                    board[row][col + 1] = Tile(v: 0)
                    
                    var currIndex = col
                    while currIndex != 0 {
                        if board[row][currIndex].val == board[row][currIndex - 1].val {
                            board[row][currIndex - 1] = Tile(v: board[row][currIndex].val + board[row][currIndex - 1].val)
                            board[row][currIndex] = Tile(v: 0)
                        } else if board[row][currIndex - 1].val == 0 {
                            board[row][currIndex - 1] = board[row][currIndex]
                            board[row][currIndex] = Tile(v: 0)
                        }
                        
                        currIndex -= 1
                    }
                }
            }
            
        }
    }
    
    func rightRotate() {
        let newBoard : [[Tile]] = rotate2D(input: board)
        board = newBoard
    }
    
    func collapse(dir: Direction) {
        if dir == Direction.left {
            shiftLeft()
        } else if dir == Direction.right {
            rightRotate()
            rightRotate()
            shiftLeft()
            rightRotate()
            rightRotate()
        } else if dir == Direction.up {
            rightRotate()
            rightRotate()
            rightRotate()
            shiftLeft()
            rightRotate()
        } else if dir == Direction.down {
            rightRotate()
            shiftLeft()
            rightRotate()
            rightRotate()
            rightRotate()
        }
    }
}
