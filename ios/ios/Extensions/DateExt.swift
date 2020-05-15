//
//  DateExt.swift
//  ios
//
//  Created by Tom Burke on 5/13/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import Foundation

extension Date{
    
     static var thisYear: Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let component = formatter.string(from: Date())
        
        if let value = Int(component) {
            return value
        }
        return 0
    }
    
    var dayOfWeek: String {
         let dayNumber = Calendar.current.component(.weekday, from: self)
         // day number starts from 1 but array count from 0
         return daysOfTheWeek[dayNumber - 1]
    }

    private var daysOfTheWeek: [String] {
         return  ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    }
    
    private static func getComponent(date: Date, format: String) -> String {
           let formatter = DateFormatter()
           formatter.dateFormat = format
        formatter.locale = Locale.autoupdatingCurrent
           let component = formatter.string(from: date)
           return component
    }
    
    static func getFollowingThirtyDays(for month: Int = 1) -> [WorkoutDate]{
        var dates = [WorkoutDate]()
        let dateComponents = DateComponents(year: thisYear , month: month)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!

        let range = calendar.range(of: .day, in: .month, for: date)!
        
        for i in range{
            guard let fullDate = calendar.date(byAdding: DateComponents(day: i) , to: Date()) else { continue }
            let d = getComponent(date: fullDate, format: "dd")
            let m = getComponent(date: fullDate, format: "MM")
            let y = getComponent(date: fullDate, format: "yy")
            let workoutDate = WorkoutDate(day: d, month: m, year: y)
            dates.append(workoutDate)
        }
        
        return dates
        
    }
    
    static func getAvailableWorkoutDates() -> [WorkoutDate]{
        var dates = [WorkoutDate]()
        print(Date().dayOfWeek)
        /*
        let dateComponents = DateComponents(year: thisYear , month: month)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!*/
        return dates
    }
}

