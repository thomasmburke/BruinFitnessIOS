//
//  ScheduleListView.swift
//  ios
//
//  Created by Tom Burke on 4/29/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct ScheduleListView: View {
    
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        List{
            ForEach(userData.schedules) { schedule in
                Section(header: Text(schedule.workoutType)){
                    ForEach(schedule.scheduleTimes, id: \.self){ scheduleTime in
                        ScheduleItemView(scheduleTime: scheduleTime)
                    }
                }
            }
        }
    }
}

struct ScheduleListView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleListView().environmentObject(UserData())
    }
}
