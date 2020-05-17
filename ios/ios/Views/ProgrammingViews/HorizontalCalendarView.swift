//
//  HorizontalCalendarView.swift
//  ios
//
//  Created by Tom Burke on 4/27/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct HorizontalCalendarView: View {
    
    private let dates = Date.getAvailableWorkoutDates()
    //@State private var selectedDate: WorkoutDate = WorkoutDate.default
    // Select the current day by default
    @State private var selectedDate: WorkoutDate = Date.getAvailableWorkoutDates()[Date.calendarConfig["select"]!]
    //@EnvironmentObject var userData: UserData
    //@State private var selectedDate = dates[Date.calendarConfig["select"]!]
    
    
    @Binding var date: WorkoutDate
    
    var body: some View {
       VStack(alignment: .leading) {
           Text("Date")
            .font(.headline)
            .padding(.leading)
            ScrollView(.horizontal, showsIndicators: false) {
               HStack{
                   ForEach(dates, id: \.day){ date in
                       DateView(date: date, isSelected: self.selectedDate.day == date.day, onSelect: { selectedDate in
                    //DateView(date: date, isSelected: self.userData.selectedDate.day == date.day, onSelect: { selectedDate in
                           self.selectedDate = selectedDate
                        //self.userData.selectedDate = selectedDate
                           self.date = selectedDate
                       })
                   }
               }.padding(.horizontal)
           }
       }
    }
}

struct HorizontalCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCalendarView(date: .constant(WorkoutDate.default))//.environmentObject(UserData())
    }
}
