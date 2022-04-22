//
//  NotesView.swift
//  eduFlix
//
//  Created by Reya on 13.04.22.

//test

import SwiftUI

struct NotesView: View {
    @State var revealImagePicker: Bool = false
    @StateObject  var imageData = ImageData()
    var body: some View {
         
        //NavigationView {
        ZStack {
            VStack {
                Text("Notes ").font(.largeTitle)
                    .font(.title3).bold()
                    .padding()
                   // .position(x: 100, y: 100)
                    .frame(maxWidth: .infinity, alignment: .leading) .font(.system(.title, design: .rounded))
                    .font(.system(size: 10))
                    
                    .foregroundColor(Color("Orange"))
                Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                    .fontWeight(.light).foregroundColor(.white)
                
                if imageData.imageNote.isEmpty {
                    Text("Add new note")
                        .foregroundColor(.orange)
                    
                } else {
                    MainView()
                }
            }
        }
            
       
            .sheet(isPresented: $revealImagePicker) {
                ImagePicker(sourceType: .photoLibrary) { image in
                    //add note
                    imageData.addNewNote(image: image, title: "Edit", description: "")
                }
                
            }
          //.background(Color(hue: 0.26, saturation: 0.101, brightness: 0.9))
            .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
   
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        revealImagePicker.toggle()
                    } label: {
                        Label("Image", systemImage: "photo.on.rectangle.angled")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation{
                            // delete data
                            imageData.resetUserData()
                        }
                    } label: {
                        Label("Bin", systemImage: "trash")
                    }
                }
            }
            .environmentObject(imageData)
        
        }
       // .navigationTitle("My Notes")
        
    }
//}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        NotesView()
    }
}
