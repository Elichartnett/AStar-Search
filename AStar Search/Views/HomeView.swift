//
//  HomeView.swift
//  AStar Search
//
//  Created by Eli Hartnett on 8/30/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var boardModel = BoardModel()
    @State var addSpaceType: SpaceType = .start
    @State var sliderValue: Double = 10
    
    var body: some View {
        
        VStack {
            
            Picker("Picker", selection: $addSpaceType) {
                Text("Start")
                    .tag(SpaceType.start)
                Text("Empty")
                    .tag(SpaceType.empty)
                Text("Obstacle")
                    .tag(SpaceType.obstacle)
                Text("Goal")
                    .tag(SpaceType.goal)
            }
            .pickerStyle(.segmented)
            
            Slider(value: $sliderValue, in: 5...15, step: 1) { _ in
                boardModel.createBoard()
            }
            .onChange(of: sliderValue) { _ in
                boardModel.boardSize = Int(sliderValue)
            }
            
            BoardView(boardModel: boardModel, addSpaceType: addSpaceType)
                .onAppear {
                    boardModel.createBoard()
                }
            
            Button {
                boardModel.goToNextSpace()
            } label: {
                Text("Start")
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
