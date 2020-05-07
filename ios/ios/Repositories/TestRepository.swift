//
//  TestRepository.swift
//  ios
//
//  Created by Tom Burke on 5/6/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//
import Foundation
//import Disk

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
//import FirebaseFunctions

import Combine
import Resolver

class BaseTestRepository {
  @Published var tests = [Test]()
}

protocol TestRepository: BaseTestRepository {
  func addTest(_ test: Test)
  func removeTest(_ test: Test)
  func updateTest(_ test: Test)
}

class TestDataTaskRepository: BaseTestRepository, TestRepository, ObservableObject {
  override init() {
    super.init()
    self.tests = testDataTests
  }
  
  func addTest(_ test: Test) {
    tests.append(test)
  }
  
  func removeTest(_ test: Test) {
    if let index = tests.firstIndex(where: { $0.id == test.id }) {
      tests.remove(at: index)
    }
  }
  
  func updateTest(_ test: Test) {
    if let index = self.tests.firstIndex(where: { $0.id == test.id } ) {
      self.tests[index] = test
    }
  }
}


class FirestoreTestRepository: BaseTestRepository, TestRepository, ObservableObject {
  @Injected var db: Firestore
  //@Injected var authenticationService: AuthenticationService
  //@LazyInjected var functions: Functions

  //var tasksPath: String = "tasks"
  //var userId: String = "unknown"
  
  private var listenerRegistration: ListenerRegistration?
  private var cancellables = Set<AnyCancellable>()
  
  override init() {
    super.init()
    self.loadData()
  }
  
  private func loadData() {
    if listenerRegistration != nil {
      listenerRegistration?.remove()
    }
    listenerRegistration = db.collection("example")
      //.whereField("userId", isEqualTo: self.userId)
      //.order(by: "createdTime")
      .addSnapshotListener { (querySnapshot, error) in
        if let querySnapshot = querySnapshot {
          self.tests = querySnapshot.documents.compactMap { document -> Test? in
            try? document.data(as: Test.self)
          }
        }
      }
  }
  
  func addTest(_ test: Test) {
    var _ = 1
    /*
    do {
      var userTask = task
      userTask.userId = self.userId
      let _ = try db.collection(tasksPath).addDocument(from: userTask)
    }
    catch {
      fatalError("Unable to encode task: \(error.localizedDescription).")
    }
 */
  }
  
  func removeTest(_ test: Test) {
    var _ = 1
    /*
    if let taskID = task.id {
      db.collection(tasksPath).document(taskID).delete { (error) in
        if let error = error {
          print("Unable to remove document: \(error.localizedDescription)")
        }
      }
    }*/
  }
  
  func updateTest(_ test: Test) {
    var _ = 1
    /*
    if let taskID = task.id {
      do {
        try db.collection(tasksPath).document(taskID).setData(from: task)
      }
      catch {
        fatalError("Unable to encode task: \(error.localizedDescription).")
      }
    }
 */
  }
  
    /*
  func migrateTasks(fromUserId: String) {
    let data = ["previousUserId": fromUserId]
    functions.httpsCallable("migrateTasks").call(data) { (result, error) in
      if let error = error as NSError? {
        print("Error: \(error.localizedDescription)")
      }
      print("Function result: \(result?.data ?? "(empty)")")
    }
  }*/
}
