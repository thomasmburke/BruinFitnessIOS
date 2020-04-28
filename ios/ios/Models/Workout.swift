//
//  Workout.swift
//  ios
//
//  Created by Tom Burke on 4/27/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct Workout: Codable, Hashable, Identifiable {
    var workoutType: String
    var id: Int
    var name: String
    var goal: String
    var description: String
}
