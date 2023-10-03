//
//  Onboarding.swift
//  LittleLemonRestaurant
//
//  Created by Tosin Akinbobuyi on 10/2/23.
//

import SwiftUI

struct Onboarding: View {
    let kFirstName:String = "firstName"
    let kLastName:String = "lastName"
    let kEmail:String = "email"
    
    @State var isLoggedIn = false
    @State var firstName = "Mike"
    @State var lastName = "Jones"
    @State var email = "Email"
       
    func validate() -> Bool {
        let test =  !(firstName.isEmpty || lastName.isEmpty || email.isEmpty)
        return test;
    }
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: Home(), isActive: $isLoggedIn){
                    EmptyView()
                }
                TextField("FirstName", text: $firstName)
                TextField("LastName", text: $lastName)
                TextField("Email", text: $email)
                
                Button("Register"){
                    if validate() {
                        
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        
                        isLoggedIn = true
                    }
                }
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
