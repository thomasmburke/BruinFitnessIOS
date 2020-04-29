//
//  WorkoutCardList.swift
//  ios
//
//  Created by Tom Burke on 4/27/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct WorkoutCardList: View {
    
    @EnvironmentObject private var userData: UserData
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        List{
            ForEach(userData.workouts) { workout in
                WorkoutCardView(workout: workout)
                
                //.animation(.easeInOut(duration: 1.5))
            }
        }
        // stops row item from jumping when collapsed
        // but unfortunately breaks all other animations
        // other animations overlap the below row item
        //.animation(nil)
        .animation(.easeInOut(duration: 0.05))
        // background color surrounding list items
        .listRowBackground(Color("bruinBackgroundColor"))
        // background color of entire view list
        .background(Color("bruinBackgroundColor"))
        // ensures the list item doesn't flash white when clicked
        .buttonStyle(PlainButtonStyle())
    }
}

struct WorkoutCardList_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCardList().environmentObject(UserData())
    }
}
