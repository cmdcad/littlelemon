//
//  UserProfile.swift
//  LittleLemonRestaurant
//
//  Created by Tosin Akinbobuyi on 10/2/23.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
   // @EnvironmentObject private var model: Model
    
    let firstName = UserDefaults.standard.string(forKey: "kFirstName")
    let lastName = UserDefaults.standard.string(forKey: "kLastName")
    let email = UserDefaults.standard.string(forKey: "kEmail")
    
    let kIsLoggedIn = "kIsLoggedIn"
    @State var isLoggedIn = false
   
    /*
    init(){
        model.showHero = false
    }
     */
    
    var body: some View {
        VStack{
            Text("Personal Information")
               // .font(.headline)
            Image("profile-placeholder-image-png")
                .resizable()
                .frame(width: 100, height: 100)
            
            Text(firstName ?? "")
            Text(lastName  ?? "")
            Text(email ?? "")
            
            Button("LogOut"){
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
        }
        .onAppear{
            if UserDefaults.standard.value(forKey: kIsLoggedIn)as? Bool ?? false {
                isLoggedIn = true
            }
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
          //  .environmentObject(Model())
    }
}
