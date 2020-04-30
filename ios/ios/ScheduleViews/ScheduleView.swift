//
//  ScheduleView.swift
//  ios
//
//  Created by Tom Burke on 4/29/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct ScheduleView: View {
    var body: some View {
        VStack{
            
            // Add HorizontalCalendarView here
            
            Text("Boston")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding([.top, .leading, .trailing])
                .edgesIgnoringSafeArea(.bottom)
            
            /*Divider()
                .padding()
                .frame(height: 2.0)
            .background(Color("bruinGreenColor"))*/
            
            // Using Custom Divider to get horizontal padding
            CustomDivider()
            
            Spacer()
        }
        .background(Color("bruinBackgroundColor"))
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
