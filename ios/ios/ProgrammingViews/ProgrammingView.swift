//
//  ProgrammingView.swift
//  ios
//
//  Created by Tom Burke on 4/29/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct ProgrammingView: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
        VStack{
            
            // Add HorizontalCalendarView here
            
            HStack{
                Text("Bruin Programming")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding([.top, .leading, .trailing])
                    .edgesIgnoringSafeArea(.bottom)
                
                Spacer()
            }
            
            /*Divider()
                .padding()
                .frame(height: 2.0)
            .background(Color("bruinGreenColor"))*/
            
            // Using Custom Divider to get horizontal padding
            CustomDivider()
            
            WorkoutCardList()
        }
        .background(Color("bruinBackgroundColor"))
        
        
    }
}

struct ProgrammingView_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammingView().environmentObject(UserData())
    }
}
