//
//  ScheduleFilterListView.swift
//  ios
//
//  Created by Tom Burke on 5/2/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct ScheduleFilterListView: View {
    
    @EnvironmentObject private var userData: UserData
    //@State private var workoutTypeExample = "All"
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "bruinBackgroundColor")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "bruinGreenColor") ?? UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
    }
    
    var body: some View {
//        ScrollView(.horizontal, showsIndicators: true){
//            HStack{
//                Text("All")
//                    .font(.subheadline)
//                    .foregroundColor(Color.white)
//                    .bold()
//                ForEach(userData.schedules) { schedule in
//                    Text(schedule.workoutType)
//                        .font(.subheadline)
//                        .foregroundColor(Color.white)
//                        .bold()
//                }
//            }
//        }
//        .padding(.leading)
//        .background(Color("bruinBackgroundColor"))
        
        
        Picker("Schedule Filter",
               //selection: $workoutTypeExample) {
        selection: $userData.scheduleFilter) {
            Text("All").tag("All")
            ForEach(userData.schedules) { schedule in
                Text(schedule.workoutType).tag(schedule.workoutType)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .background(Color("bruinBackgroundColor"))
        .padding(.horizontal)
        
    }
}

struct ScheduleFilterListView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleFilterListView().environmentObject(UserData())
    }
}
