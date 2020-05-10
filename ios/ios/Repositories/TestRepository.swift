//
//  TestRepository.swift
//  ios
//
//  Created by Tom Burke on 5/6/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class TestRepository: ObservableObject {
    
    let db = Firestore.firestore()
    @Published var tests = [Test]()
    private var listenerRegistration: ListenerRegistration?
    
    init(){
        loadData()
    }
    
    func loadData() {
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
    
}

