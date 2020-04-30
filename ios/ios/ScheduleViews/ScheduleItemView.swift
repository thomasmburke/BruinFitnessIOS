//
//  ScheduleItemView.swift
//  ios
//
//  Created by Tom Burke on 4/29/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct ScheduleItemView: View {
    var body: some View {
        HStack{
            Text("5:00am - 6:00am")
            .font(.body)
            .foregroundColor(Color.white.opacity(0.87))
            
            Spacer()
            
            Text("Mon-Fri")
            .font(.body)
            .foregroundColor(Color.white.opacity(0.87))
        }
        .padding()
        .background(Color("bruinBackgroundColor"))
    }
}

struct ScheduleItemView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleItemView()
    }
}
