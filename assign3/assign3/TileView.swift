//
//  TileView.swift
//  assign3
//
//  Created by Meisheng Liu on 10/15/21.
//

import SwiftUI

struct TileView: View {
    var tile : Tile
    var length: CGFloat = 20
    var spacing: CGFloat = 17
    
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
        if tile.val != 0 {
            //ZStack {
                Text("\(tile.val)")
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(width: 80, height: 80)
                    .background(Rectangle().fill(changeColor(num: tile.val)).shadow(radius: 3))
                    .cornerRadius(15)
                    .offset(x: CGFloat(-120) + (CGFloat(80*spacing) / length + spacing) * CGFloat(tile.lastCol), y:  CGFloat(-70) + (CGFloat(80*spacing) / length + spacing) * CGFloat(tile.lastRow))
            //}
            
//            ZStack {
//                Rectangle().fill(changeColor(num: tile.val))
//                Text("\(tile.val)")
//                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                    .frame(width: 80, height: 80)
//            } .offset(x: (CGFloat(80-3*spacing) / length + spacing) * CGFloat(tile.lastCol), y:  (CGFloat(80-3*spacing) / length + spacing) * CGFloat(tile.lastRow))
//                .cornerRadius(15)
//                .frame(width: 80, height: 80)
            
//            ZStack {
//                Rectangle().fill(changeColor(num: tile.val))
//                    .padding()
//                    .frame(width: 90, height: 90)
//                    .cornerRadius(15)
//                    .offset(x: (CGFloat(80-3*spacing) / length + spacing) * CGFloat(tile.lastCol), y:  (CGFloat(80-3*spacing) / length + spacing) * CGFloat(tile.lastRow))
//
//                Text("\(tile.val)")
//                    .fixedSize(horizontal: false, vertical: true)
//                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                    .offset(x: (CGFloat(80-3*spacing) / length + spacing) * CGFloat(tile.lastCol), y:  (CGFloat(80-3*spacing) / length + spacing) * CGFloat(tile.lastRow))
//            }
        } else {
           // ZStack {
                Text("")
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(width: 80, height: 80)
                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                    .cornerRadius(15)
                    .offset(x: CGFloat(-120) + (CGFloat(80*spacing) / length + spacing) * CGFloat(tile.lastCol), y: CGFloat(-70) + (CGFloat(80*spacing) / length + spacing) * CGFloat(tile.lastRow))
           // } .offset(x: CGFloat(-120) + (CGFloat(80*spacing) / length + spacing) * CGFloat(tile.lastCol), y: CGFloat(-70) + (CGFloat(80*spacing) / length + spacing) * CGFloat(tile.lastRow))
            
//            ZStack {
//                Rectangle().fill(Color.gray)
//                Text("")
//                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                    .frame(width: 80, height: 80)
//            } .offset(x: (CGFloat(80-3*spacing) / length + spacing) * CGFloat(tile.lastCol), y:  (CGFloat(80-3*spacing) / length + spacing) * CGFloat(tile.lastRow))
//                .cornerRadius(15)
//                .frame(width: 80, height: 80)
        }
    }
}
