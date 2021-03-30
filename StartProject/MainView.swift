//
//  MainView.swift
//  StartProject
//
//  Created by 박광규 on 2021/03/20.
//

import SwiftUI
import AdBrixRM

struct MainView: View {
    // HomeView Event!!!
    
    var body: some View {
        
        TabView{
            ContentView()
                
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Order())
    }
}
