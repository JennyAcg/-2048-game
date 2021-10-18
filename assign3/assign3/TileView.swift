//
//  TileView.swift
//  assign3
//
//  Created by Meisheng Liu on 10/15/21.
//

import SwiftUI

struct TileView: View {
    var tile : Tile
    
    init (tile: Tile) {
        self.tile = tile
    }
    
    func changeColor(num: Int) -> Color {
        if num == 2 {
            return Color.red
        } else if num == 4 {
            return Color.orange
        } else if num == 8 {
            return Color.yellow
        } else if num == 16 {
            return Color.green
        } else if num == 32 {
            return Color.pink
        } else if num == 64 {
            return Color.blue
        } else if num == 128 {
            return Color.purple
        } else {
            return Color.gray
        }
    }
    
    var body: some View {
        ZStack {
            if tile.val != 0 {
                Text("\(tile.val)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(width: 80, height: 80)
                    .background(Rectangle().fill(changeColor(num: tile.val)).shadow(radius: 3))
                    .cornerRadius(15)
            } else {
                Text("")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(width: 80, height: 80)
                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                    .cornerRadius(15)
            }
        } .offset(x: CGFloat(-120) + 85 * CGFloat(tile.lastCol), y: CGFloat(-70) + 85 * CGFloat(tile.lastRow))
    }
}
