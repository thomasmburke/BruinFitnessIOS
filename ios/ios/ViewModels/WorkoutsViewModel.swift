//
//  WorkoutsViewModel.swift
//  ios
//
//  Created by Tom Burke on 6/20/21.
//  Copyright © 2021 Bruin Fitness. All rights reserved.
//

import Foundation
import FirebaseFirestore
class WorkoutsViewModel: ObservableObject {
  @Published var workouts: Workouts = .empty
  @Published var errorMessage: String?
  
  private var db = Firestore.firestore()
  
  func fetchData(documentId: String) {
    let docRef = db.collection("workouts").document(documentId)
    docRef.getDocument { document, error in
      if let error = error as NSError? {
        self.errorMessage = "Error getting document: \(error.localizedDescription)"
      }
      else {
        let result = Result { try document?.data(as: Workouts.self) }
        switch result {
        case .success(let workouts):
          if let workouts = workouts {
            // A Book value was successfully initialized from the DocumentSnapshot.
            self.workouts = workouts
            self.errorMessage = nil
          }
          else {
            // A nil value was successfully initialized from the DocumentSnapshot,
            // or the DocumentSnapshot was nil.
            self.errorMessage = "Document doesn't exist."
          }
        case .failure(let error):
          // A Book value could not be initialized from the DocumentSnapshot.
          switch error {
          case DecodingError.typeMismatch(let type, let context):
            self.errorMessage = "\(error.localizedDescription): \(context.debugDescription)"
          case DecodingError.valueNotFound(let type, let context):
            self.errorMessage = "\(error.localizedDescription): \(context.debugDescription)"
          case DecodingError.keyNotFound(let key, let context):
            self.errorMessage = "\(error.localizedDescription): \(context.debugDescription)"
          case DecodingError.dataCorrupted(let key):
            self.errorMessage = "\(error.localizedDescription): \(key)"
          default:
            self.errorMessage = "Error decoding document: \(error.localizedDescription)"
          }
        }
      }
    }
  }
}
