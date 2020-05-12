//
//  ScheduleListFirestoreView.swift
//  ios
//
//  Created by Tom Burke on 5/10/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct ScheduleListFirestoreView: View {
    
    @ObservedObject var scheduleListVM = ScheduleListViewModel()
    @EnvironmentObject private var userData: UserData
    
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

struct ScheduleListFirestoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleListFirestoreView().environmentObject(UserData())
    }
}

