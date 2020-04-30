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
}
