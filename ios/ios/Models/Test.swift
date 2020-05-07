//
//  Test.swift
//  ios
//
//  Created by Tom Burke on 5/6/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Test: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var desc: String
}

#if DEBUG
let testDataTests = [
    Test(title: "Implement UI", desc: "Tom"),
    Test(title: "Connect to Firebase", desc: "Margaux")
]
#endif
