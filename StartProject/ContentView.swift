//
//  ContentView.swift
//  StartProject
//
//  Created by 박광규 on 2021/03/16.
//

import SwiftUI
import AdBrixRM

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    
    var body: some View {
        // If you want to do something when a user tap an item on the list, use NavigationLinked
        NavigationView{
            List{
                ForEach(menu){ section in
                    Section(header: Text(section.name)){
                        ForEach(section.items){ item in
                            NavigationLink(
                                destination: ItemDetail(item: item)){
                                ItemRow(item: item)
                            }
                        }
                        
                    }
                }
                
            }
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
