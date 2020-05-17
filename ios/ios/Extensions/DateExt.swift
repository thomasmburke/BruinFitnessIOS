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
    
    static func -(lhs: Date, rhs: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: -rhs, to: lhs)!
    }
    
    static var calendarConfig: [String : Int] {
        var config = [String : Int]()
         switch Date().dayOfWeek {
             case "Sun":
                 config["futureDaysCount"] = 7;
                 config["pastDaysCount"] = 7;
                 config["initialIndexPosition"] = 5;
                 config["select"] = 7;
                 //break;
             case "Mon":
                 config["futureDaysCount"] = 6;
                 config["pastDaysCount"] = 8;
                 config["initialIndexPosition"] = 6;
                 config["select"] = 8;
                 //break;
             case "Tue":
                 config["futureDaysCount"] = 5;
                 config["pastDaysCount"] = 9;
                 config["initialIndexPosition"] = 7;
                 config["select"] = 9;
                 //break;
             case "Wed":
                 config["futureDaysCount"] = 4;
                 config["pastDaysCount"] = 10;
                 config["initialIndexPosition"] = 8;
                 config["select"] = 10;
                 //break;
             case "Thu":
                 config["futureDaysCount"] = 3;
                 config["pastDaysCount"] = 11;
                 config["initialIndexPosition"] = 9;
                 config["select"] = 11;
                 //break;
             case "Fri":
                 config["futureDaysCount"] = 2;
                 config["pastDaysCount"] = 12;
                 config["initialIndexPosition"] = 10;
                 config["select"] = 12;
                 //break;
             case "Sat":
                 config["futureDaysCount"] = 1;
                 config["pastDaysCount"] = 13;
                 config["initialIndexPosition"] = 11;
                 config["select"] = 13;
                 //break;
             default :
                 print("invalid day of the week");
         }
        return config
    }
    
    static func getAvailableWorkoutDates() -> [WorkoutDate]{
        var dates = [WorkoutDate]()
        
        print(Date().dayOfWeek)
        /*var calendarConfig = [String : Int]()
        
        switch Date().dayOfWeek {
            case "Sun":
                calendarConfig["futureDaysCount"] = 7;
                calendarConfig["pastDaysCount"] = 7;
                calendarConfig["initialIndexPosition"] = 5;
                calendarConfig["select"] = 7;
                //break;
            case "Mon":
                calendarConfig["futureDaysCount"] = 6;
                calendarConfig["pastDaysCount"] = 8;
                calendarConfig["initialIndexPosition"] = 6;
                calendarConfig["select"] = 8;
                //break;
            case "Tue":
                calendarConfig["futureDaysCount"] = 5;
                calendarConfig["pastDaysCount"] = 9;
                calendarConfig["initialIndexPosition"] = 7;
                calendarConfig["select"] = 9;
                //break;
            case "Wed":
                calendarConfig["futureDaysCount"] = 4;
                calendarConfig["pastDaysCount"] = 10;
                calendarConfig["initialIndexPosition"] = 8;
                calendarConfig["select"] = 10;
                //break;
            case "Thu":
                calendarConfig["futureDaysCount"] = 3;
                calendarConfig["pastDaysCount"] = 11;
                calendarConfig["initialIndexPosition"] = 9;
                calendarConfig["select"] = 11;
                //break;
            case "Fri":
                calendarConfig["futureDaysCount"] = 2;
                calendarConfig["pastDaysCount"] = 12;
                calendarConfig["initialIndexPosition"] = 10;
                calendarConfig["select"] = 12;
                //break;
            case "Sat":
                calendarConfig["futureDaysCount"] = 1;
                calendarConfig["pastDaysCount"] = 13;
                calendarConfig["initialIndexPosition"] = 11;
                calendarConfig["select"] = 13;
                //break;
            default :
                print("invalid day of the week");
        }*/
        
        let today = Date()
        let startDate = today - Date.calendarConfig["pastDaysCount"]!
        //let startDate = today - calendarConfig["pastDaysCount"]!
        let dateComponents = DateComponents(year: thisYear , month: 1)
        let calendar = Calendar.current
        //let date = calendar.date(from: dateComponents)!
        
        //let range = calendar.range(of: .day, in: .month, for: date)!
        let range = 0 ... 14
        
        for i in range{
            guard let fullDate = calendar.date(byAdding: DateComponents(day: i) , to: startDate) else { continue }
            let d = getComponent(date: fullDate, format: "dd")
            let m = getComponent(date: fullDate, format: "MM")
            let y = getComponent(date: fullDate, format: "yy")
            let workoutDate = WorkoutDate(day: d, month: m, year: y)
            dates.append(workoutDate)
        }
        return dates
    }
}



