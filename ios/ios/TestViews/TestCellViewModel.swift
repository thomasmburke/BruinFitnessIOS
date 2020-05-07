//
//  TestCellViewModel.swift
//  ios
//
//  Created by Tom Burke on 5/6/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import Foundation
import Combine
import Resolver

class TestCellViewModel: ObservableObject, Identifiable  {
  @Injected var testRepository: TestRepository
  
  @Published var test: Test
  
  var id: String = ""
  @Published var completionStateIconName = ""
  
  private var cancellables = Set<AnyCancellable>()
  
  static func newTest() -> TestCellViewModel {
    TestCellViewModel(test: Test(title: "", desc: ""))
  }
  
  init(test: Test) {
    self.test = test

    $test
      .compactMap { $0.id }
      .assign(to: \.id, on: self)
      .store(in: &cancellables)
    
    $test
      .dropFirst()
      .debounce(for: 0.8, scheduler: RunLoop.main)
      .sink { task in
        self.testRepository.updateTest(test)
      }
      .store(in: &cancellables)
  }
  
}
