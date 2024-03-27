//
//  ContentView.swift
//  TicTacToe
//
//  Created by Melike Soygüllücü on 26.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var gameState = GameState()

    var body: some View {
        let borderSize = CGFloat(8)
        
            HStack {
                Spacer()
                Button(action: {
                    gameState.resetBoard()
                }, label: {
                    Text("Try Again")
                        .font(.title3)
            })
                .padding(20)
            }
        

        Text(gameState.turnText())
            .font(.title)
            .bold()
            .padding()
        
        VStack (spacing: borderSize){
            ForEach(0...2, id: \.self){
                row in HStack (spacing: borderSize){
                    ForEach(0...2, id: \.self){
                        column in
                        let cell = gameState.board[row][column]
                        Text(cell.displayTile())
                            .font(.system(size: 60))
                            .bold()
                            .foregroundStyle(cell.tileColor())
                            .frame(maxWidth: .infinity, maxHeight: .infinity )
                            .aspectRatio(1, contentMode: .fit)
                            .background(.white)
                            .onTapGesture {
                                gameState.placeTile(row, column)
                            }
                    }
                }
            }
            
        }
        .background(.black)
        .padding()
        .alert(isPresented: $gameState.showAlert) {
            Alert(title: Text(gameState.alertMessage),
                  dismissButton: .default(Text("Okay"))
                  {
                   gameState.resetBoard()
                  }
            )
        }
        
        HStack {
            Text(String(format: "X Score: %d", gameState.crossesScroe))
                .font(.title)
                .bold()
                .padding()
                .foregroundColor(.blue)
            
            
            Text(String(format: "O Score: %d", gameState.noughtsScore))
                .font(.title)
                .bold()
                .padding()
                .foregroundColor(.red)
        }
        
        Text(String(format: "Tie: %d", gameState.drawScore))
            .font(.title)
            .bold()
            .padding()
            
    }
}

#Preview {
    ContentView()
}
