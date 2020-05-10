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
        VStack(spacing: 0){
         
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
            
            CustomDivider(color: Color.black, width: 1)
        }
        .listRowInsets(EdgeInsets(
        top: 0,
        leading: 10,
        bottom: 0,
        trailing: 10))
    }
}

struct ScheduleItemView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleItemView(scheduleTime: scheduleData[0].scheduleTimes[0])
    }
}
