//
//  ContentView.swift
//  assign2
//
//  Created by Meisheng Liu on 9/28/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isRandom = false
    @StateObject var twos = Twos()

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
            VStack (spacing: 20) {
                Text("Score: \(twos.score)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.regular)
                    .fixedSize()
                    .offset(y:-70)
                
                ZStack {
                    VStack (spacing: 4) {
                        HStack (spacing: 4) {
                            if twos.board[0][0].val != 0 {
                                Text("\(twos.board[0][0].val)")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(changeColor(num: twos.board[0][0].val)).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            } else {
                                Text("")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            }
                            
                            if twos.board[0][1].val != 0 {
                                Text("\(twos.board[0][1].val)")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(changeColor(num: twos.board[0][1].val)).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            } else {
                                Text("")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            }
                            
                            if twos.board[0][2].val != 0 {
                                Text("\(twos.board[0][2].val)")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(changeColor(num: twos.board[0][2].val)).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            } else {
                                Text("")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            }
                            
                            if twos.board[0][3].val != 0 {
                                Text("\(twos.board[0][3].val)")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(changeColor(num: twos.board[0][3].val)).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            } else {
                                Text("")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            }
                            
                        }
                        
                        HStack (spacing: 4) {
                            if twos.board[1][0].val != 0 {
                                Text("\(twos.board[1][0].val)")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(changeColor(num: twos.board[1][0].val)).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            } else {
                                Text("")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            }
                            
                            if twos.board[1][1].val != 0 {
                                Text("\(twos.board[1][1].val)")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(changeColor(num: twos.board[1][1].val)).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            } else {
                                Text("")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            }
                            
                            if twos.board[1][2].val != 0 {
                                Text("\(twos.board[1][2].val)")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(changeColor(num: twos.board[1][2].val)).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            } else {
                                Text("")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            }
                            
                            if twos.board[1][3].val != 0 {
                                Text("\(twos.board[1][3].val)")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(changeColor(num: twos.board[1][3].val)).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            } else {
                                Text("")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            }
                            
                        }
                        
                        HStack (spacing: 4) {
                            if twos.board[2][0].val != 0 {
                                Text("\(twos.board[2][0].val)")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(changeColor(num: twos.board[2][0].val)).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            } else {
                                Text("")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            }
                            
                            if twos.board[2][1].val != 0 {
                                Text("\(twos.board[2][1].val)")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(changeColor(num: twos.board[2][1].val)).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            } else {
                                Text("")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            }
                            
                            if twos.board[2][2].val != 0 {
                                Text("\(twos.board[2][2].val)")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(changeColor(num: twos.board[2][2].val)).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            } else {
                                Text("")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            }
                            
                            if twos.board[2][3].val != 0 {
                                Text("\(twos.board[2][3].val)")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(changeColor(num: twos.board[2][3].val)).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            } else {
                                Text("")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            }
                            
                        }
                        
                        
                        HStack (spacing: 4) {
                            if twos.board[3][0].val != 0 {
                                Text("\(twos.board[3][0].val)")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(changeColor(num: twos.board[3][0].val)).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            } else {
                                Text("")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            }
                            
                            if twos.board[3][1].val != 0 {
                                Text("\(twos.board[3][1].val)")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(changeColor(num: twos.board[3][1].val)).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            } else {
                                Text("")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            }
                            
                            if twos.board[3][2].val != 0 {
                                Text("\(twos.board[3][2].val)")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(changeColor(num: twos.board[3][2].val)).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            } else {
                                Text("")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            }
                            
                            if twos.board[3][3].val != 0 {
                                Text("\(twos.board[3][3].val)")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(changeColor(num: twos.board[3][3].val)).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            } else {
                                Text("")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                                    .cornerRadius(15)
                                    .offset(y:-70)
                            }
                            
                        }
                    }
                }
                
                
                VStack(spacing: 10) {
                    HStack {
                        Button("Up", action: {
                            checkMove()
                            if twos.collapse(dir: Direction.up) {
                                twos.spawn()
                            }
                        })
                        .frame(width: 100.0, height: 39.0)
                        .cornerRadius(5)
                        .border(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, width: 2)
                        .offset(y:-40)
                        .alert(isPresented: $twos.isGameOver) {
                            Alert(
                                title: Text("Game Over!"),
                                message: Text("Your score is: \(twos.score), click New Game button to start a new game")
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
                                }
                            }).frame(width: 100.0, height: 39.0)
                            .cornerRadius(15)
                            .border(Color.blue, width: 2)
                            .offset(y:-30)
                            .alert(isPresented: $twos.isGameOver) {
                                Alert(
                                    title: Text("Game Over!"),
                                    message: Text("Your score is: \(twos.score), click New Game button to start a new game")
                                )
                            }
                        }
                        
                        Spacer()
                        
                        VStack {
                            Button("Right", action: {
                                checkMove()
                                if twos.collapse(dir: Direction.right) {
                                    twos.spawn()
                                }
                            })
                            .frame(width: 100.0, height: 39.0)
                            .cornerRadius(15)
                            .border(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, width: 2)
                            .offset(y:-30)
                            .alert(isPresented: $twos.isGameOver) {
                                Alert(
                                    title: Text("Game Over!"),
                                    message: Text("Your score is: \(twos.score), click New Game button to start a new game")
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
                            }
                        })
                        .frame(width: 100.0, height: 39.0)
                        .cornerRadius(15)
                        .border(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, width: 2)
                        .offset(y:-20)
                        .alert(isPresented: $twos.isGameOver) {
                            Alert(
                                title: Text("Game Over!"),
                                message: Text("Your score is: \(twos.score), click New Game button to start a new game")
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
        } .environmentObject(twos)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
