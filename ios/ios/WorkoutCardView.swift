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
    
    var body: some View {
        // Container to add background and corner radius to
        //VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("CrossFit")
                        .font(.title)
                        .foregroundColor(Color.white.opacity(0.87))
                        .bold()
                    Text("Functional fitness")
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
                
            }.padding()
        //}
        .background(Color("workoutCardColor"))
        .cornerRadius(20)
        .shadow(radius: 5)
        // Card border
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color("workoutCardBorderColor"), lineWidth: 4)
        )
        .padding()
    }
}



struct WorkoutCardView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCardView()
    }
}
