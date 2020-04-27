//
//  WorkoutCardView.swift
//  ios
//
//  Created by Tom Burke on 4/26/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct WorkoutCardView: View {
    var body: some View {
        // Container to add background and corner radius to
        VStack {
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
            }.padding()
        }
        .background(Color.black)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct WorkoutCardView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCardView()
    }
}
