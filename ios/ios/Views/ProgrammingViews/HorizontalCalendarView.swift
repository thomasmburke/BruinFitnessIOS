//
//  HorizontalCalendarView.swift
//  ios
//
//  Created by Tom Burke on 4/27/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct HorizontalCalendarView: View {
    
    @State private var selectedDate: WorkoutDate = WorkoutDate.default
    private let dates = Date.getFollowingThirtyDays()
    
    @Binding var date: WorkoutDate
    
    var body: some View {
       VStack(alignment: .leading) {
           Text("Date")
               .font(.headline).padding(.leading)
            ScrollView(.horizontal, showsIndicators: false) {
               HStack{
                   ForEach(dates, id: \.day){ date in
                       DateView(date: date, isSelected: self.selectedDate.day == date.day, onSelect: { selectedDate in
                           self.selectedDate = selectedDate
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
        HorizontalCalendarView(date: .constant(WorkoutDate.default))
    }
}
