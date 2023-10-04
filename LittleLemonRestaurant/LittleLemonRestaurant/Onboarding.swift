//
//  Onboarding.swift
//  LittleLemonRestaurant
//
//  Created by Tosin Akinbobuyi on 10/2/23.
//

import SwiftUI

struct Onboarding: View {
    @EnvironmentObject private var model: Model
    
    let kFirstName:String = "firstName"
    //let kLastName:String = "lastName"
    let kEmail:String = "email"
    let kIsLoggedIn = "kIsLoggedIn"
    
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
                    
                 
                }
                
                Hero()
                    .background(Color("CustomGreen"))
                
                VStack{
                    HStack{
                        Text("Name *")
                                .foregroundColor(.gray)
                            Spacer()
                    }
                                    
                    TextField("FirstName", text: $firstName)
                    
                    HStack{
                    Text("Email *")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                                    
                    TextField("Email", text: $email)
                
                    Button("Register"){
                        if validate() {
                                            
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            //UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            
                            isLoggedIn = true
                        }
                    }
                    .onAppear(){
                        let v = UserDefaults.standard.bool(forKey: kIsLoggedIn)
                        isLoggedIn = v
                    }
                }
                .padding()
                Spacer()
            }
          //  .navigationTitle(   Text("")   )
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

 

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
            .environmentObject(Model())
    }
}
