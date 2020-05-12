//
//  ScheduleListViewModel.swift
//  ios
//
//  Created by Tom Burke on 5/10/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import Foundation
import Combine
import Resolver

class ScheduleListViewModel: ObservableObject {
    
    //@Published var scheduleRepository = ScheduleRepository()
    @Published var scheduleRepository: ScheduleRepository = Resolver.resolve()
    @Published var scheduleCellViewModels = [ScheduleCellViewModel]()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        scheduleRepository.$schedules
            .map { schedules in
                schedules.map { schedule in
                    ScheduleCellViewModel(schedule: schedule)
                }
            }
            .assign(to: \.scheduleCellViewModels, on: self)
            .store(in: &cancellables)
        //print(scheduleRepository.schedules)
      }
    
    
}
