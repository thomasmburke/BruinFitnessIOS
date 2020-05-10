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
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        //UITableView.appearance().separatorStyle = .none
        //UITableView.appearance().separatorColor = .white
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        List{
            ForEach(userData.schedules) { schedule in
                if (self.userData.scheduleFilter == schedule.workoutType || self.userData.scheduleFilter == "All"){
                    Section(header:ScheduleHeader(scheduleHeader: schedule.workoutType)
                    ){
                        ForEach(schedule.scheduleTimes, id: \.self){ scheduleTime in
                            ScheduleItemView(scheduleTime: scheduleTime)
                        }
                    }
                }
            }
        }
        // background color surrounding list items
        .listRowBackground(Color("bruinBackgroundColor"))
        // background color of entire view list
        .background(Color("bruinBackgroundColor"))
    }
}

struct ScheduleListView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleListView().environmentObject(UserData())
    }
}
