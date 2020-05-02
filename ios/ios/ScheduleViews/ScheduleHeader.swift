//
//  ScheduleHeader.swift
//  ios
//
//  Created by Tom Burke on 5/1/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct ScheduleHeader: View {
    
    var scheduleHeader: String
    
    var body: some View {
        HStack{
            Text(scheduleHeader)
                .font(.headline)
                .foregroundColor(Color.white)
                .bold()
                .padding()
        
        Spacer()
        }
        .background(Color("bruinBackgroundColor"))
        .listRowInsets(EdgeInsets(
        top: 0,
        leading: 0,
        bottom: 0,
        trailing: 0))
    }
}

struct ScheduleHeader_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleHeader(scheduleHeader: scheduleData[0].workoutType)
    }
}
