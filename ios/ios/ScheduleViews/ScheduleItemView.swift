//
//  ScheduleItemView.swift
//  ios
//
//  Created by Tom Burke on 4/29/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct ScheduleItemView: View {
    
    var scheduleTime: Schedule.ScheduleTime
    
    var body: some View {
        HStack{
            Text(scheduleTime.time)
            .font(.body)
            .foregroundColor(Color.white.opacity(0.87))
            
            Spacer()
            
            Text(scheduleTime.day)
            .font(.body)
            .foregroundColor(Color.white.opacity(0.87))
        }
        .padding()
        .background(Color("bruinBackgroundColor"))
    }
}

struct ScheduleItemView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleItemView(scheduleTime: scheduleData[0].scheduleTimes[0])
    }
}
