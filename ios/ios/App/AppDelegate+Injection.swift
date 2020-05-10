//
//  AppDelegate+Injection.swift
//  ios
//
//  Created by Tom Burke on 5/6/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//
/*
import Foundation
import Resolver
import FirebaseFirestore

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    // register Firebase services
    register { Firestore.firestore().useEmulator() }.scope(application)
    
    // register application components
    register { FirestoreTestRepository() as TestRepository }.scope(application)
  }
}

extension Firestore {
  func useEmulator() -> Firestore {
    #if USE_FIREBASE_EMULATORS
    print("Using the Firebase Emulator for Cloud Firestore, running on port 8080")
    let settings = self.settings
    settings.host = "localhost:8080"
    settings.isPersistenceEnabled = false
    settings.isSSLEnabled = false
    self.settings = settings
    #else
    print("Using Cloud Firestore in production")
    #endif
    return self
  }
}

*/
