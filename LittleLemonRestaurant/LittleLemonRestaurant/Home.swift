//
//  Home.swift
//  LittleLemonRestaurant
//
//  Created by Tosin Akinbobuyi on 10/2/23.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var model: Model
    
    let persistence = PersistenceController()
    
    var body: some View {
        TabView{
            Menu()
                .tag(0)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                    //Text("Menu")
                }
                .environment(\.managedObjectContext, persistence.container.viewContext)
            
            UserProfile()
                .tag(0)
                .tabItem{
                    Label("User Profile", systemImage: "square.and.pencil")
                    Text("User Profile")
                }
                .environmentObject(Model())
        }
        .background(Color.white)
        .navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(Model())
    }
}
