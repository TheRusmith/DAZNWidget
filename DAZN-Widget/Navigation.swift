//
//  Navigation.swift
//  DAZN-Widget
//
//  Created by Mariano Piscitelli on 23/03/22.
//

import SwiftUI

struct Navigation: View {
    
    @State private var selection = 1
    
    var body: some View {
        
//        NavigationView {
            TabView(selection: $selection) {
                
                
                HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
                
                
         
                MyTeamView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("MyTeam")
                    }
                    .tag(1)
         
                
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
                    .tag(2)
                
            }
            .accentColor(Color(red: 235.0/255.0, green: 242.0/255.0, blue: 23.0/255.0, opacity: 1.0))
            .background(Color(red: 8.0/255.0, green: 23.0/255.0, blue: 29.0/255.0, opacity: 1.0))
            .onAppear() {
                UITabBar.appearance().barTintColor = .white
                UITabBar.appearance().isTranslucent = false
                
            }
            
            .navigationTitle("TabView Demo")
//        }
    }
    
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
