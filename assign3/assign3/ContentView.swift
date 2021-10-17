//
//  ContentView.swift
//  assign3
//
//  Created by Meisheng Liu on 10/5/21.
//

import SwiftUI

struct BoardView: View {
    @State private var isRandom = false
    @EnvironmentObject var twos: Twos
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    func checkMove() {
        let oldBoard : [[Tile]] = twos.board
        let oldScore : Int = twos.score
        
        if !twos.collapse(dir: Direction.up) && !twos.collapse(dir: Direction.left) && !twos.collapse(dir: Direction.right) && !twos.collapse(dir: Direction.down) {
            twos.isGameOver = true
        } else {
            twos.board = oldBoard
            twos.score = oldScore
        }
    }
    
    var body: some View {
        if verticalSizeClass == .regular {
            VStack (spacing: 100) {
                VStack {
                    Text("Score: \(twos.score)")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.regular)
                        .fixedSize()
                        .offset(y:-70)
                        .padding(.top, 50)
                    
                    ZStack {
                        ForEach (0..<4) { i in
                            ForEach (0..<4) { j in
                                if twos.board[i][j].val != 0 {
                                    TileView(tile: twos.board[i][j])
                                        .transition(.slide)
                                        .animation(.linear)
                                } else {
                                    TileView(tile: twos.board[i][j])
                                }
                            }
                        }
                    }.padding(.bottom, 140)
                    .gesture(
                        DragGesture()
                            .onEnded ({ position in
                                let start = position.translation
                                checkMove()
                                
                                if abs(start.width) < abs(start.height) {
                                    if start.height < 0 && twos.collapse(dir: Direction.up) {
                                        twos.spawn()
                                        twos.changePos()
                                    } else {
                                        if twos.collapse(dir: Direction.up) {
                                            twos.spawn()
                                            twos.changePos()
                                            twos.printPos()
                                        }
                                    }
                                } else {
                                    if start.width < 0 && twos.collapse(dir: Direction.left) {
                                        twos.spawn()
                                        twos.changePos()
                                    } else {
                                        if twos.collapse(dir: Direction.right) {
                                            twos.spawn()
                                            twos.changePos()
                                            twos.printPos()
                                        }
                                    }
                                }
                                
                            })
                    )
                }
                
                VStack(spacing: 10) {
                    HStack {
                        Button("Up", action: {
                            checkMove()
                            if twos.collapse(dir: Direction.up) {
                                twos.spawn()
                                twos.changePos()
                                //twos.printPos()
                            }
                        })
                            .frame(width: 100.0, height: 39.0)
                            .cornerRadius(5)
                            .border(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, width: 2)
                            .offset(y:-40)
                            .alert(isPresented: $twos.isGameOver) {
                                Alert (
                                    title: Text("Game Over!"),
                                    message: Text("Your score is: \(twos.score)"),
                                    dismissButton: Alert.Button.default(
                                        Text("Ok"), action: {
                                            twos.scoreList.append(Score(score: twos.score, time: Date(), index: twos.scoreList.count + 1))
                                            twos.sortScoreList()
                                            print(twos.scoreList)
                                            twos.newgame(rand: isRandom)
                                            twos.spawn()
                                            twos.spawn()
                                        }
                                    )
                                )
                            }
                    }
                    
                    HStack {
                        Spacer()
                        
                        VStack {
                            Button("Left", action: {
                                checkMove()
                                if twos.collapse(dir: Direction.left) {
                                    twos.spawn()
                                    twos.changePos()
                                    //twos.printPos()
                                }
                            }).frame(width: 100.0, height: 39.0)
                                .cornerRadius(15)
                                .border(Color.blue, width: 2)
                                .offset(y:-30)
                                .alert(isPresented: $twos.isGameOver) {
                                    Alert (
                                        title: Text("Game Over!"),
                                        message: Text("Your score is: \(twos.score)"),
                                        dismissButton: Alert.Button.default(
                                            Text("Ok"), action: {
                                                twos.scoreList.append(Score(score: twos.score, time: Date(), index: twos.scoreList.count + 1))
                                                twos.sortScoreList()
                                                print(twos.scoreList)
                                                twos.newgame(rand: isRandom)
                                                twos.spawn()
                                                twos.spawn()
                                            }
                                        )
                                    )
                                }
                        }
                        
                        Spacer()
                        
                        VStack {
                            Button("Right", action: {
                                checkMove()
                                if twos.collapse(dir: Direction.right) {
                                    twos.spawn()
                                    twos.changePos()
                                    //twos.printPos()
                                }
                            })
                                .frame(width: 100.0, height: 39.0)
                                .cornerRadius(15)
                                .border(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, width: 2)
                                .offset(y:-30)
                                .alert(isPresented: $twos.isGameOver) {
                                    Alert(
                                        title: Text("Game Over!"),
                                        message: Text("Your score is: \(twos.score)"),
                                        dismissButton: Alert.Button.default(
                                            Text("Ok"), action: {
                                                twos.scoreList.append(Score(score: twos.score, time: Date(), index: twos.scoreList.count + 1))
                                                twos.sortScoreList()
                                                print(twos.scoreList)
                                                twos.newgame(rand: isRandom)
                                                twos.spawn()
                                                twos.spawn()
                                            }
                                        )
                                    )
                                }
                        }
                        
                        Spacer()
                    }
                    
                    HStack {
                        Button("Down", action: {
                            checkMove()
                            if twos.collapse(dir: Direction.down) {
                                twos.spawn()
                                twos.changePos()
                                //twos.printPos()
                            }
                        })
                            .frame(width: 100.0, height: 39.0)
                            .cornerRadius(15)
                            .border(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, width: 2)
                            .offset(y:-20)
                            .alert(isPresented: $twos.isGameOver) {
                                Alert (
                                    title: Text("Game Over!"),
                                    message: Text("Your score is: \(twos.score)"),
                                    dismissButton: Alert.Button.default(
                                        Text("Ok"), action: {
                                            twos.scoreList.append(Score(score: twos.score, time: Date(), index: twos.scoreList.count + 1))
                                            twos.sortScoreList()
                                            print(twos.scoreList)
                                            twos.newgame(rand: isRandom)
                                            twos.spawn()
                                            twos.spawn()
                                        }
                                        )
                                    )
                                }
                        }
                        
                        HStack {
                            Button("New Game", action: {
                                twos.newgame(rand: isRandom)
                                twos.spawn()
                                twos.spawn()
                            })
                                .frame(width: 100.0, height: 39.0)
                                .border(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, width: 2)
                                .cornerRadius(1)
                                .offset(y:10)
                                
                        }
                        
                        VStack (spacing: 1) {
                            Picker("Please choose a game play", selection: $isRandom) {
                                Text("Random").tag(true)
                                Text("Deterministic").tag(false)
                            }
                            .onChange(of: isRandom, perform: { (value) in
                                twos.newgame(rand: isRandom)
                                twos.spawn()
                                twos.spawn()
                            })
                            .frame(width: 300, height: 35)
                            .offset(y:30)
                        }
                    }
                }
        } else {
            HStack {
                VStack {
                    ZStack {
                        ForEach (0..<4) { i in
                            ForEach (0..<4) { j in
                                TileView(tile: twos.board[i][j]).animation(.spring())
                            }
                        }
                    }.padding(.bottom, 100)
                    .padding(.leading, 180)
                    .gesture(
                        DragGesture()
                            .onEnded ({ position in
                                let start = position.translation
                                checkMove()

                                if abs(start.width) < abs(start.height) {
                                    if start.height < 0 && twos.collapse(dir: Direction.up) {
                                        twos.spawn()
                                        twos.changePos()
                                    } else {
                                        if twos.collapse(dir: Direction.up) {
                                            twos.spawn()
                                            twos.changePos()
                                            twos.printPos()
                                        }
                                    }
                                } else {
                                    if start.width < 0 && twos.collapse(dir: Direction.left) {
                                        twos.spawn()
                                        twos.changePos()
                                    } else {
                                        if twos.collapse(dir: Direction.right) {
                                            twos.spawn()
                                            twos.changePos()
                                            twos.printPos()
                                        }
                                    }
                                }

                            })
                    )
                }.padding(.trailing, 200)
                
                VStack(spacing: 1) {
                    HStack {
                        VStack {
                            Text("Score: \(twos.score)")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .fontWeight(.regular)
                                .fixedSize()
                                .offset(y:-70)
                                .padding(.top, 100)
                            
                            Button("Up", action: {
                                checkMove()
                                if twos.collapse(dir: Direction.up) {
                                    twos.spawn()
                                    twos.changePos()
                                    //twos.printPos()
                                }
                            })
                                .frame(width: 100.0, height: 39.0)
                                .cornerRadius(5)
                                .border(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, width: 2)
                                .offset(y:-40)
                                .alert(isPresented: $twos.isGameOver) {
                                    Alert (
                                        title: Text("Game Over!"),
                                        message: Text("Your score is: \(twos.score)"),
                                        dismissButton: Alert.Button.default(
                                            Text("Ok"), action: {
                                                twos.scoreList.append(Score(score: twos.score, time: Date(), index: twos.scoreList.count + 1))
                                                twos.sortScoreList()
                                                print(twos.scoreList)
                                                twos.newgame(rand: isRandom)
                                                twos.spawn()
                                                twos.spawn()
                                            }
                                        )
                                    )
                                }
                        }
                    }
                    
                    HStack {
                        Spacer()
                        
                        VStack {
                            Button("Left", action: {
                                checkMove()
                                if twos.collapse(dir: Direction.left) {
                                    twos.spawn()
                                    twos.changePos()
                                    //twos.printPos()
                                }
                            }).frame(width: 100.0, height: 39.0)
                                .cornerRadius(15)
                                .border(Color.blue, width: 2)
                                .offset(y:-30)
                                .alert(isPresented: $twos.isGameOver) {
                                    Alert (
                                        title: Text("Game Over!"),
                                        message: Text("Your score is: \(twos.score)"),
                                        dismissButton: Alert.Button.default(
                                            Text("Ok"), action: {
                                                twos.scoreList.append(Score(score: twos.score, time: Date(), index: twos.scoreList.count + 1))
                                                twos.sortScoreList()
                                                print(twos.scoreList)
                                                twos.newgame(rand: isRandom)
                                                twos.spawn()
                                                twos.spawn()
                                            }
                                        )
                                    )
                                }
                        }
                        
                        Spacer()
                        
                        VStack {
                            Button("Right", action: {
                                checkMove()
                                if twos.collapse(dir: Direction.right) {
                                    twos.spawn()
                                    twos.changePos()
                                    //twos.printPos()
                                }
                            })
                                .frame(width: 100.0, height: 39.0)
                                .cornerRadius(15)
                                .border(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, width: 2)
                                .offset(y:-30)
                                .alert(isPresented: $twos.isGameOver) {
                                    Alert(
                                        title: Text("Game Over!"),
                                        message: Text("Your score is: \(twos.score)"),
                                        dismissButton: Alert.Button.default(
                                            Text("Ok"), action: {
                                                twos.scoreList.append(Score(score: twos.score, time: Date(), index: twos.scoreList.count + 1))
                                                twos.sortScoreList()
                                                print(twos.scoreList)
                                                twos.newgame(rand: isRandom)
                                                twos.spawn()
                                                twos.spawn()
                                            }
                                        )
                                    )
                                }
                        }
                        
                        Spacer()
                    }
                    
                    HStack {
                        Button("Down", action: {
                            checkMove()
                            if twos.collapse(dir: Direction.down) {
                                twos.spawn()
                                twos.changePos()
                                //twos.printPos()
                            }
                        })
                            .frame(width: 100.0, height: 39.0)
                            .cornerRadius(15)
                            .border(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, width: 2)
                            .offset(y:-20)
                            .alert(isPresented: $twos.isGameOver) {
                                Alert (
                                    title: Text("Game Over!"),
                                    message: Text("Your score is: \(twos.score)"),
                                    dismissButton: Alert.Button.default(
                                        Text("Ok"), action: {
                                            twos.scoreList.append(Score(score: twos.score, time: Date(), index: twos.scoreList.count + 1))
                                            twos.sortScoreList()
                                            print(twos.scoreList)
                                            twos.newgame(rand: isRandom)
                                            twos.spawn()
                                            twos.spawn()
                                        }
                                    )
                                )
                            }
                    }
                    
                    HStack {
                        Button("New Game", action: {
                            twos.newgame(rand: isRandom)
                            twos.spawn()
                            twos.spawn()
                        })
                            .frame(width: 100.0, height: 39.0)
                            .border(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, width: 2)
                            .cornerRadius(1)
                            .offset(y:10)
                    }
                    
                    VStack {
                        Picker("Please choose a game play", selection: $isRandom) {
                            Text("Random").tag(true)
                            Text("Deterministic").tag(false)
                        }
                        .onChange(of: isRandom, perform: { (value) in
                            twos.newgame(rand: isRandom)
                            twos.spawn()
                            twos.spawn()
                        })
                        .frame(width: 300, height: 35)
                        .offset(y:30)
                        .padding(.bottom, 50)
                    }
                }
            }.environmentObject(twos)
        }
    }
}

struct ContentView: View {
    @StateObject var twos = Twos()
    
    var body: some View {
        TabView {
            BoardView().tabItem {
                Label("Board", systemImage: "gamecontroller")
            }
            
            ScoresView().tabItem {
                Label("Scores", systemImage: "list.dash")
            }
            
            AboutView().tabItem {
                Label("About", systemImage: "person")
            }
        } .environmentObject(twos)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Twos()).previewInterfaceOrientation(.portrait)
    }
}
