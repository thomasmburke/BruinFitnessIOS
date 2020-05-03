//
//  ScheduleView.swift
//  ios
//
//  Created by Tom Burke on 4/29/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct ScheduleView: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack{
            
            // Add HorizontalCalendarView here
            
            Text("Boston")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding([.top, .leading, .trailing])
                .edgesIgnoringSafeArea(.bottom)
            
            // Using Custom Divider to get horizontal padding
            CustomDivider(color:
                Color("bruinGreenColor"),
                //Color.black,
                width: 1)
            
            ScheduleFilterListView()
            
            CustomDivider(color:
            Color("bruinGreenColor"),
            //Color.black,
            width: 1)
            
            ScheduleListView()
        }
        .background(Color("bruinBackgroundColor"))
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView().environmentObject(UserData())
    }
}
