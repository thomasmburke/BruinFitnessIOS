//
//  UserData.swift
//  ios
//
//  Created by Tom Burke on 4/27/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var workouts = workoutData
    @Published var schedules = scheduleData
    
    // ScheduleFilterListView modifies this state variable
    // ScheduleListView listens and diplays corresponding schedules
    @Published var scheduleFilter = "All"
    //let dates = Date.getAvailableWorkoutDates()
    //init() {
    //    @Published var selectedDate: WorkoutDate = self.dates[Date.calendarConfig["select"]!]
    //}
    
}
