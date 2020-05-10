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

    
    /*
     Combine Subscriptions to the Test Publisher
     */
    // Ensure Identifiable ids are being set for each TaskCellViewModel
    $test
        .compactMap { $0.id }
        .assign(to: \.id, on: self)
        // This will avoid memory leaks be unsubscribing any combine subscriptions upon de-init()
        .store(in: &cancellables)
    /*
    // This is leveraged if Tests will be updated
    $test
      // If we make a change to the doc via the console, this prevents an infinite loop
      .dropFirst()
      // ensures the write is not written to Firestore until a person is done typing (after 0.8s of no typing a write will go to Firestore)
      .debounce(for: 0.8, scheduler: RunLoop.main)
      .sink { test in
        self.testRepository.updateTest(test)
      }
        // This will avoid memory leaks be unsubscribing any combine subscriptions upon de-init()
      .store(in: &cancellables)
    */
  }
  
}
