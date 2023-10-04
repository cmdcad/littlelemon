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
   
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    
    init(){
        firstName = UserDefaults.standard.string(forKey: "kFirstName") ?? ""
        lastName = UserDefaults.standard.string(forKey: "kLastName") ?? ""
       email = UserDefaults.standard.string(forKey: "kEmail") ?? ""
          
    }
    
    let kIsLoggedIn = "kIsLoggedIn"
    @State var isLoggedIn = false
   
   
    
    var body: some View {
        ScrollView{
            VStack{
            HStack(){
                Text("Personal Information")
                     .font(.headline)
                Spacer()
            }
            
            VStack(alignment: .leading) {
                HStack{
                    Text("Avater")
                       // .foregroundColor(Color.gray)
                    Spacer()
                }
                .padding(.top, 16)
                
                HStack(spacing: 20){
                    Image("profile-placeholder-image")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Button(action:{}){
                        Text("Change")
                    }
                    .padding([.horizontal])
                    .padding(.vertical, 10)
                    .background(Color("CustomGreen"))
                    .cornerRadius(10)
                    .foregroundColor(Color.white)
                    
                    Button(action:{}){
                        Text("Remove")
                            .cornerRadius(10)
                    }
                    .padding([.horizontal])
                    .padding(.vertical, 10)
                    .foregroundColor(Color.black)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.2)))
                    
                    Spacer()
                }
                .padding(.bottom, 16)
                
                Text("First Name" )
                TextField("FirstName", text: $firstName)
                    .padding(16)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(.gray.opacity(0.2)))
                
                Text("Last Name"  )
                TextField("Last Name", text: $email)
                    .padding(16)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(.gray.opacity(0.2)))
                
                Text("Email" )
                TextField("Email", text: $email)
                    .padding(16)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(.gray.opacity(0.2)))
                
                Text("Phone number" )
                TextField("PhoneNumber", text: $email)
                    .padding(16)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(.gray.opacity(0.2)))
              
            }
             
            HStack(){
                Text("Email notifications")
                     .font(.headline)
                Spacer()
            }
            .padding(.vertical, 8)
            
            VStack(spacing:20){
                CheckBox(isChecked: true, text: "Order statuses")
                CheckBox(isChecked: true, text: "Password changes")
                CheckBox(isChecked: true, text: "Special offers")
                CheckBox(isChecked: true, text: "Newsletters")
            }
            .padding(.vertical, 8)
            
            Button(action: { UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                              self.presentation.wrappedValue.dismiss()}){
                              Text("Log out")
                          }
                              .frame(minWidth:300)
                              .padding(10)
                              .background(Color("CustomYellow")).foregroundColor(Color.black)
                              .cornerRadius(10)
            
            HStack(spacing: 10){
                Button(action:{}){
                    Text("Discard Changes")
                }
                .padding([.horizontal])
                .padding(.vertical, 10)
                .background(Color("CustomGreen"))
                .cornerRadius(10)
                .foregroundColor(Color.white)
                
                Spacer()
                
                Button(action:{}){
                    Text("Save Changes")
                        .cornerRadius(10)
                }
                .padding([.horizontal])
                .padding(.vertical, 10)
                .foregroundColor(Color.black)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.2)))
            }
            .padding(32)
        }
        .onAppear{
            if UserDefaults.standard.value(forKey: kIsLoggedIn)as? Bool ?? false {
                isLoggedIn = true
            }
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
