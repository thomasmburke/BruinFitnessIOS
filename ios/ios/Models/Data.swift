//
//  Data.swift
//  ios
//
//  Created by Tom Burke on 4/27/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit
import SwiftUI

let workoutData: [Workout] = load("workoutData.json", jsonIndex: false)
let scheduleData: [Schedule] = load("scheduleData.json", jsonIndex: false)

func load<T: Decodable>(_ filename: String, jsonIndex: Bool) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        if (jsonIndex){
            return try decoder.decode(T.self, from: data)
        }else{
            return try decoder.decode(T.self, from: data)
        }
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
