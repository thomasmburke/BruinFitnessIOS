//
//  Workouts.swift
//  ios
//
//  Created by Tom Burke on 6/20/21.
//  Copyright © 2021 Bruin Fitness. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift
import SwiftUI

struct WorkoutDescription: Codable {
    var coolDown: String?
    var skill: String?
    var strength: String?
    var warmUp: String?
    var workout: String
    var workoutDate: String
    var workoutType: String
}

struct Workouts: Codable {
    @DocumentID var id: String?
    var Metcon: WorkoutDescription?
    var Weightlifting: WorkoutDescription?
    var Mobility: WorkoutDescription?
}

extension Workouts {
    static let empty = Workouts(Metcon: nil, Weightlifting: nil, Mobility: nil)
}
