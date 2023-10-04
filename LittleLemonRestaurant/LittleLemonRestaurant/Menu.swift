//
//  Menu.swift
//  LittleLemonRestaurant
//
//  Created by Tosin Akinbobuyi on 10/2/23.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText: String = ""
    @State var seachBarIsVisible:Bool = false
   
    var body: some View {
        VStack{
            VStack{
              
                Group{
                    Hero()
                }
                 
                HStack(spacing: 10){
                    Button(action: {seachBarIsVisible.toggle()})   {
                        ZStack{
                            Circle()
                                .fill(Color.white)
                                .frame(width: 35, height: 35)
                            Image(systemName: "magnifyingglass")
                        }
                    }
                    if seachBarIsVisible {
                        ZStack(){
                            Rectangle()
                                .fill(.white)
                                .frame(height: 35).cornerRadius(30)
                            VStack{
                                TextField("Search Item", text: $searchText)
                                    .cornerRadius(30)
                                    .padding(.horizontal,16)
                            }
                        }
                    }
                    else{
                        Spacer()
                    }
                }
                
                .padding()
            }
            .background(Color("CustomGreen"))
            
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) {
                    (dishes: [Dish]) in
                    List {
                        ForEach(dishes, id:\.self) { dish in
                            HStack(spacing: 30){
                                Text("\(dish.title ?? "empty")  - \(dish.price ?? "")")
                                Spacer()
//                                if checkImage(dish.image ?? ""){
//                                    AsyncImage(url: URL(string: dish.image!))
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(maxWidth: 70, maxHeight: 70)
//                                }
//                                else{
                                    Image("logo-waiter")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                    
                              //  }
                                    
                        }
                    }
                   // .listStyle(.plain)
                }
            }
        }
        .onAppear(){
            getMenuData()
        }
    }
    
    
    func checkImage(_ source: String) -> Bool{
        guard let _ = URL(string: source) else {
            return false
        }
        return true
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
    }
    
    func buildPredicate() -> NSPredicate {
        if searchText == "" {
                          return NSPredicate(value: true)
                      }
                      return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
    
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [
                   NSSortDescriptor(key: "title",
                                    ascending: true,
                                    selector:
                     #selector(NSString .localizedCaseInsensitiveCompare)),
                   NSSortDescriptor(key: "price",
                                    ascending: true,
                                    selector:
                     #selector(NSString .localizedCaseInsensitiveCompare))
               ]
    }
    
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(Model())
    }
}
