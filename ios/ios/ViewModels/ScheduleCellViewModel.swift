//
//  ScheduleCellViewModel.swift
//  ios
//
//  Created by Tom Burke on 5/10/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import Foundation
import Combine


class ScheduleCellViewModel: ObservableObject, Identifiable  {
  
    @Published var schedule: Schedule

    var id: Int = 0

    private var cancellables = Set<AnyCancellable>()

    init(schedule: Schedule) {
        self.schedule = schedule

    
    /*
     Combine Subscriptions to the Schedule Publisher
     */
    // Ensure Identifiable ids are being set for each TaskCellViewModel
        $schedule
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            // This will avoid memory leaks be unsubscribing any combine subscriptions upon de-init()
            .store(in: &cancellables)
  }
  
}
