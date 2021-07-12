//
//  DeleteMe.swift
//  ios
//
//  Created by Tom Burke on 6/20/21.
//  Copyright © 2021 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct DeleteMe: View {
    @ObservedObject var viewModel = WorkoutsViewModel()
    
    @ViewBuilder
    var body: some View {
        VStack{
            Text(viewModel.workouts.Mobility?.workoutType ?? "")
                .font(.title)
                .fontWeight(.bold)
//                .foregroundColor(Color.white)
                .padding([.top, .leading, .trailing])
                .edgesIgnoringSafeArea(.bottom)
            
            if viewModel.workouts.Mobility?.warmUp != "" {
                Text(viewModel.workouts.Mobility?.warmUp ?? "")
            }
            if viewModel.workouts.Mobility?.skill != "" {
                Text(viewModel.workouts.Mobility?.skill ?? "")
            }
            if viewModel.workouts.Mobility?.strength != "" {
                Text(viewModel.workouts.Mobility?.strength ?? "")
            }
            if viewModel.workouts.Mobility?.workout != "" {
                Text(viewModel.workouts.Mobility?.workout ?? "")
            }
            if viewModel.workouts.Mobility?.coolDown != "" {
                Text(viewModel.workouts.Mobility?.coolDown ?? "")
            }
        }
//        .background(Color("bruinBackgroundColor"))
        .onAppear() {
            self.viewModel.fetchData(documentId: "2021-06-20")
          }
    }
}

struct DeleteMe_Previews: PreviewProvider {
    static var previews: some View {
        DeleteMe()
    }
}



