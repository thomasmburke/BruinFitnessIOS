//
//  Schedule.swift
//  ios
//
//  Created by Tom Burke on 4/29/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct Schedule: Codable, Hashable, Identifiable {
    var cityName: String
    var id: Int
    var day: String
    var time: String
    var workoutTypeHeader: String
}
