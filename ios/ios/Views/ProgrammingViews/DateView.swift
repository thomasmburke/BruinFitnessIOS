//
//  DateView.swift
//  ios
//
//  Created by Tom Burke on 5/13/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct DateView: View {
    
    var date: WorkoutDate = WorkoutDate(day: "03", month: "11", year: "20")
    var isSelected: Bool
    var onSelect: ((WorkoutDate)->()) = {_ in }
    
    var body: some View {
        VStack {
            Text("\(date.day)")
                .font(.title)
                .bold()
                .foregroundColor(isSelected ? .white : .black)
            
            Text("\(date.month)/\(date.year)")
                .foregroundColor(isSelected ? .white : .black)
                .font(.callout)
                .padding(.top, 10)
            
        }.padding()
            .background( isSelected ? Color("bruinGreenColor"): Color.gray.opacity(0.3))
            //.clipShape(DateShape())
            .cornerRadius(10)
            .onTapGesture {
                self.onSelect(self.date)
        }
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView(isSelected: false)
    }
}
