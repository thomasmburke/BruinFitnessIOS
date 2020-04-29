//
//  WorkoutCardView.swift
//  ios
//
//  Created by Tom Burke on 4/26/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct DeleteMe: View {
    
    @State private var showDetail = false
    var workout: Workout
    
    var transition: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    var body: some View {
        
        ZStack {
            Color("bruinBackgroundColor")
            .edgesIgnoringSafeArea(.all)
        
        
        // Vertical stack for total (expanded) card
        VStack {
            // Horizontal stack for unexpanded card
            HStack {
                // Vertical stack for unexpanded card
                VStack(alignment: .leading) {
                    Text(workout.workoutType)
                        .font(.title)
                        .foregroundColor(Color.white)
                        .bold()
                    Text(workout.goal)
                        .font(.subheadline)
                        .foregroundColor(Color.white.opacity(0.60))
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        self.showDetail.toggle()
                    }
                }) {
                    Image(systemName: "chevron.down.circle")
                    .foregroundColor(Color("bruinGreenColor"))
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 180 : 0))
                        .scaleEffect(showDetail ? 1.5 : 1.2)
                        .padding()
                }
            }
            // inner card padding
            .padding()
            
            subView()
            //.animation(.easeOut(duration: 1.5))
            //.transition(transition)
        }
        .background(Color("workoutCardColor"))
        .cornerRadius(20)
        .shadow(radius: 5)
        // Card border
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color("workoutCardBorderColor"), lineWidth: 4)
                //.listRowBackground(/*@START_MENU_TOKEN@*/Color.red/*@END_MENU_TOKEN@*/)
        )
        // outer card padding, so card doesn't touch edges of the screen
        .padding()
        
        }
    }
    
    func subView() -> some View {
        Group {
            if showDetail {
                Text("test2\n\ndjkljfksj")
            }
        }
    }
}



struct DeleteMe_Previews: PreviewProvider {
    static var previews: some View {
        DeleteMe(workout: workoutData[0])
    }
}
