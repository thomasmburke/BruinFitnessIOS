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
        UITabBar.appearance().barTintColor = UIColor.black
    }
        
    @State private var selection = 0
 
    // youtube.com/watch?v=e7t3Dor9oxI - working with tabview
    var body: some View {
        TabView(selection: $selection){
            Text("First View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("baseline_fitness_center_white_24pt")
                        Text("Programming")
                    }
                }
                .tag(0)
            WorkoutCardView()
                .tabItem {
                    VStack {
                        Image("baseline_schedule_white_24pt")
                        Text("Schedule")
                    }
                }
                .tag(1)
        
        }
        .accentColor(.green)
    
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
