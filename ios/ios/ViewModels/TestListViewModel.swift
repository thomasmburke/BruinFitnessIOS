//
//  TestListViewModel.swift
//  ios
//
//  Created by Tom Burke on 5/6/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import Foundation
import Combine

class TestListViewModel: ObservableObject {
    
    @Published var testRepository = TestRepository()
    @Published var testCellViewModels = [TestCellViewModel]()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        testRepository.$tests
            .map { tests in
                tests.map { test in
                    TestCellViewModel(test: test)
                }
            }
            .assign(to: \.testCellViewModels, on: self)
            .store(in: &cancellables)
      }
    
    func addTest(test: Test){
        testRepository.addTest(test)
    }
    
}
