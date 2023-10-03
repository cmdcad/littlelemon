//
//  Menu.swift
//  LittleLemonRestaurant
//
//  Created by Tosin Akinbobuyi on 10/2/23.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        VStack{
            Text("Little Lemon")
                .font(.title)
                .padding()
            Text("Chicago")
                .font(.headline)
            Text("Welcome to Little Lemon")
                .font(.body)
        }
        .onAppear(){
            getMenuData()
        }
    }
    
    func getMenuData(){
        PersistenceController().clear()
        
        let url = URL(string: "raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        
       let request = URLRequest(url: url)
      
        let  dataTask = URLSession.shared.dataTask(with: request){
            data, response, error in
            if let data = data, let string = String(data: data, encoding: .utf8)
            {
                print(string)
                let fullMenu = try! JSONDecoder().decode(JSONmenu.self, from: data)
                
                let menus = fullMenu.menu
                for item in menus{
                    let dish = Dish()
                    dish.title = item.title
                    dish.image = item.image
                    dish.price = item.price
                }
                try? viewContext.save()
            }
        }
        dataTask.resume()
       
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
