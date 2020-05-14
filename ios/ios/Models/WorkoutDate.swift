//
//  WorkoutDate.swift
//  ios
//
//  Created by Tom Burke on 5/13/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import Foundation

struct WorkoutDate: Equatable {
    var day: String
    var month: String
    var year: String
    
    static var `default`: WorkoutDate { WorkoutDate(day: "", month: "", year: "") }
    
    
    
}
