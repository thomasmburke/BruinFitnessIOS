//
//  ContentView.swift
//  ios
//
//  Created by Tom Burke on 4/24/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(named: "bruinBackgroundColor")
        UITabBar.appearance().isTranslucent = false
    }
        
    @State private var selection = 0
    @EnvironmentObject var userData: UserData
 
    var body: some View {
        TabView(selection: $selection){
            ProgrammingView()
                .tabItem {
                    VStack {
                        Image("baseline_fitness_center_white_24pt")
                        Text("Programming")
                    }
                }
                .tag(0)
            ScheduleView()
                .tabItem {
                    VStack {
                        Image("baseline_schedule_white_24pt")
                        Text("Schedule")
                    }
                }
                .tag(1)
            
            //TestListView()
            ScheduleListFirestoreView()
            .tabItem {
                VStack {
                    Image("baseline_schedule_white_24pt")
                    Text("Test")
                }
            }
            .tag(2)
        
        }
        .accentColor(Color("bruinGreenColor"))
    
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserData())
    }
}
