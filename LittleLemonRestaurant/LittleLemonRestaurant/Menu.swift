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
        
            FetchedObjects() {
                    (dishes: [Dish]) in
                    List {
                        ForEach(dishes, id:\.self) { dish in
                            HStack{
                                let p = "\(dish.title ?? "empty")) \(dish.price ?? "")";
                                Text(p)
                                AsyncImage(url: URL(string: dish.image!))
                                    .frame(width: 50, height: 50, alignment: .center)
                                    
                        }
                    }
                    .listStyle(.plain)
                }
            }
        }
        .onAppear(){
            getMenuData()
        }
    }
    
    func getMenuData(){
        PersistenceController().clear()
        
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        
       let request = URLRequest(url: url)
      
        let  dataTask = URLSession.shared.dataTask(with: request){
            data, response, error in
             
            if let data = data
            {
                let fullMenu = try! JSONDecoder().decode(JSONmenu.self, from: data)
                
             Load(fullMenu)
            }
        }
        dataTask.resume()
       
    }
    
    func Load(_ fullMenu:JSONmenu){
        let menus = fullMenu.menu
        Dish.createDishesFrom(menuItems: menus, viewContext)
//        for item:MenuItem in menus{
//            let dish = Dish()
//            dish.title = item.title
//            dish.image = item.image
//            dish.price = item.price
//        }
//        try? viewContext.save()
    }
    
    /*
    func reload() async {
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/littleLemonSimpleMenu.json")!
         let urlSession = URLSession.shared
        
        do {
            let (data, _) = try await urlSession.data(from: url)
            let fullMenu = try! JSONDecoder().decode(JSONmenu.self, from: data)
            let menuItems = fullMenu.menu
           
        }
        catch {
            fatalError("Error loading menus!")
        }
    }
     */
    
    //var menuItems = [MenuItem]()
    
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
