//
//  DatePicker.swift
//  ios
//
//  Created by Tom Burke on 6/7/21.
//  Copyright © 2021 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct WorkoutDatePicker: View {
    @State private var date = Date()
    var dateClosedRange: ClosedRange<Date> {
        let sevenDaysAgo = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
        let seven = Calendar.current.date(byAdding: .day, value: 7, to: Date())!
        return sevenDaysAgo...seven
    }

    var body: some View {
        DatePicker("Workout Date",
                   selection: $date,
                   in: dateClosedRange,
                   displayedComponents: [.date])
            .labelsHidden()
            .accentColor(Color("bruinGreenColor"))
        // Text in the date picker box is sometimes switches between 5/7/2021 format and Jun 7, 2021 format..
//            .datePickerStyle(GraphicalDatePickerStyle())
    }
}

struct WorkoutDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDatePicker()
    }
}
