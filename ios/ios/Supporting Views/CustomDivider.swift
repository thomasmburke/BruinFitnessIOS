//
//  CustomDivider.swift
//  ios
//
//  Created by Tom Burke on 4/29/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct CustomDivider: View {
    let color: Color = Color("bruinGreenColor")
    let width: CGFloat = 2
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .padding(.horizontal)
    }
}
