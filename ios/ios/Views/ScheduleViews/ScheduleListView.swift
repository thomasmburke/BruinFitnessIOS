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
    @ObservedObject var scheduleListVM = ScheduleListViewModel()
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        //UITableView.appearance().separatorStyle = .none
        //UITableView.appearance().separatorColor = .white
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        List{
            ForEach(scheduleListVM.scheduleCellViewModels) { scheduleCellVM in
                if (self.userData.scheduleFilter == scheduleCellVM.schedule.workoutType || self.userData.scheduleFilter == "All"){
                Section(header: ScheduleHeader(scheduleHeader: scheduleCellVM.schedule.workoutType)
                    ){
                        ForEach(scheduleCellVM.schedule.scheduleTimes, id: \.self){ scheduleTime in
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
