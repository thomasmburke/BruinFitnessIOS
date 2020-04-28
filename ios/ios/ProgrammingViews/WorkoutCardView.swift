//
//  WorkoutCardView.swift
//  ios
//
//  Created by Tom Burke on 4/26/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct WorkoutCardView: View {
    
    @State private var showDetail = false
    var workout: Workout
    
    var body: some View {
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
            
            if showDetail {
                // expanded portion horizontal stack to ensure text is left aligned
                HStack{
                    // Vstack for body text of expanded card portion
                    VStack{
                        Text(workout.description)
                        .font(.body)
                        .foregroundColor(Color.white.opacity(0.87))
                        // padding top comes from the bottom padding of non expanded card
                        .padding([.leading, .bottom, .trailing])
                    }
                    
                    Spacer()
                }
            }
        }
        .background(Color("workoutCardColor"))
        .cornerRadius(20)
        .shadow(radius: 5)
        // Card border
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color("workoutCardBorderColor"), lineWidth: 4)
        )
        // outer card padding, so card doesn't touch edges of the screen
        .padding()
    }
}



struct WorkoutCardView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCardView(workout: workoutData[0])
    }
}
