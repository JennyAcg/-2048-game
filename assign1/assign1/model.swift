//
//  model.swift
//  assign1
//
//  Created by Meisheng Liu on 9/14/21.
//

import Foundation

struct Tile {
        var val : Int
        var lastRow = 0, lastCol = 0
        init(v: Int) {
            val = v
        }
    }

    enum Direction {
       case left
       case right
       case up
       case down
    }
    var board: [[Tile]]                                // must be init'd, but contents overwritten

