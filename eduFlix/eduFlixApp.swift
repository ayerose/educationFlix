//
//  eduFlixApp.swift
//  eduFlix
//
//  Created by Reya on 09.04.22.
//

import SwiftUI


@main
struct eduFlixApp: App {
    var body: some Scene {
        WindowGroup {
            
            // MARK: tab view
           
           // LoginView()
            
        
            TabView {
                
                NavigationView {
                    
                    HomeView()
                    
                }
           
                           
                .tabItem {
                    Label("Home", systemImage: "house")
                    Text("Home")
                    
                }
                
                NavigationView {
                    ToDoFinalView()
                }
                        .tabItem {
                            Label("ToDos", systemImage: "checklist")
                            Text("Discover")
                            
                        }
                
                NavigationView {
                    NotesView()
                }
                        .tabItem {
                            Label("Notes", systemImage: "note.text")
                }
                NavigationView {
                    ProfileView()
                }
                        .tabItem {
                            Label("Profile", systemImage: "person.crop.circle")
        }
                
                NavigationView {
                    ContentView(card: Card.example)
                }
                   
                        .tabItem { Label("Flashcards", systemImage: "menucard") }
                                
                    

                }
            .accentColor(.orange)


        
    }
    
}
}



