//
//  ScoresView.swift
//  assign3
//
//  Created by Meisheng Liu on 10/13/21.
//

import SwiftUI

struct ScoresView: View {
    @EnvironmentObject var twos: Twos
    
    var body: some View {
        NavigationView {
            List {
                ForEach(twos.scoreList, id: \.self) { s in
                    Text("\(s.index))  \(s.score)      \(s.time)")
                }
            }
            .navigationTitle("Highest Scores")
        }
    }
}
