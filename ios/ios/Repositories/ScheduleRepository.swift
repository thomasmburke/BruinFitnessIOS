//
//  ScheduleRepository.swift
//  ios
//
//  Created by Tom Burke on 5/10/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import Foundation
import Resolver
import FirebaseFirestore
import FirebaseFirestoreSwift

class BaseRepository {
  @Published var schedules = [Schedule]()
}

protocol Repository: BaseRepository {
  func addSchedule(_ schedule: Schedule)
  func removeSchedule(_ schedule: Schedule)
  func updateSchedule(_ schedule: Schedule)
}


class ScheduleRepository: BaseRepository, Repository, ObservableObject {
    
    @Injected var db: Firestore
    //@Published var schedules = [Schedule]()
    private var scheduleListenerRegistration: ListenerRegistration?
    
    override init(){
        super.init()
        self.loadData()
    }
    
    private func loadData() {
        if scheduleListenerRegistration != nil {
            scheduleListenerRegistration?.remove()
        }
        scheduleListenerRegistration = db.collection("schedules").document("Redwood City").collection("schedule")
        //.whereField("userId", isEqualTo: self.userId)
        //.order(by: "createdTime")
        .addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                do{
                self.schedules = try querySnapshot.documents.compactMap { document -> Schedule? in
                    try document.data(as: Schedule.self)
                    }} catch{
                        print("failure to convert document to schedule")
                        print(error)
                }
            }
        }
    }
    
    func addSchedule(_ schedule: Schedule) {
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
     
     func removeSchedule(_ schedule: Schedule) {
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
     
     func updateSchedule(_ schedule: Schedule) {
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
