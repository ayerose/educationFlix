//
//  NoteView.swift
//  eduFlix
//
//  Created by Reya on 14.04.22.
//

import SwiftUI

struct NoteView: View {
    @EnvironmentObject var imageData : ImageData
    
    @State var note: ImageAndNote
    @Environment(\.presentationMode) var presentationMode
    //
    var body: some View {
    Form {
        Section {
            HStack {
                Spacer()
                Image("backgroundgreen")
                    .resizable()
                    .frame(width: 300, height: 300, alignment: .center)
                
                Spacer()
            }
            TextField("Add title", text: $note.title)
                .textSelection(.enabled)
                .onTapGesture {
                    note.title = ""
                }

            ZStack {
                TextEditor(text: $note.description)
                    .textSelection(.enabled)
                    .frame(height: 200)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("\(note.description.count)/6000")
                            .foregroundColor(.gray)
                            .padding()
                    }
                }
            }
            HStack {
                Spacer()
                Button("Save") {
                    imageData.editNote(id: note.id, title: note.title, description: note.description)
                    presentationMode.wrappedValue.dismiss()
                }
                Spacer()
            }
        }
    }
    
}
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        let tempImage = UIImage(systemName: "map")?.pngData()
        
        NoteView(note: ImageAndNote(image: tempImage!, description: "", id: UUID(), title: ""))
            .environmentObject(ImageData())
    }
}
