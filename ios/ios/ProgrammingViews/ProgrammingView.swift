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
            Text("Bruin Programming")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding([.top, .leading, .trailing])
                .edgesIgnoringSafeArea(.bottom)
            
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

struct ProgrammingView_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammingView().environmentObject(UserData())
    }
}
