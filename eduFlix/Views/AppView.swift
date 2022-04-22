//
//  AppView.swift
//  eduFlix
//
//  Created by Reya on 13.04.22.
//

import SwiftUI

struct AppView: View {
    var body: some View {
    TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ToDosView()
                .tabItem {
                    Label("ToDos", systemImage: "checklist")
                    
                }
            NotesView()
                .tabItem {
                    Label("Notes", systemImage: "note.text")
        }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
}
            FlashCardsView(card: Card.example)
           
                .tabItem { Label("Flashcards", systemImage: "menucard") }
                        
            

        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
