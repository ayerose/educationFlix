//
//  ImageDataModel.swift
//  eduFlix
//
//  Created by Reya on 14.04.22.
//

import Foundation
import SwiftUI


struct ImageAndNote : Codable, Hashable, Identifiable {
    var image : Data
    var description: String
    var id = UUID()
    var title : String
}


@MainActor class ImageData : ObservableObject  {
    
private let IMAGES_IDENTIFIER = "ImageIdentifier"
    var imageNote : [ImageAndNote] {
        didSet {
            
            objectWillChange.send()
            saveData()
            
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: IMAGES_IDENTIFIER) {
            if let doneDecodeNotes = try? JSONDecoder().decode([ImageAndNote].self, from: data) {
                imageNote = doneDecodeNotes
                
                print("success")
                return
            }
        }
        imageNote = []
    }
    // MARK: add new note
    
    func addNewNote(image: UIImage, title: String, description: String) {
        if let ShowAsPng = image.pngData() {
            let tempNote = ImageAndNote(image: ShowAsPng, description: description, title: title)
            imageNote.insert(tempNote, at: 0)
            print("Note was added!")
            saveData()
        }
    }
    // MARK: save data
    
    func saveData() {
        if let encodedNotes = try? JSONEncoder().encode(imageNote) {
            UserDefaults.standard.set(encodedNotes, forKey: IMAGES_IDENTIFIER)
        }
    }
    // MARK:  edit note
    func editNote(id: UUID, title: String, description: String) {
        if let note = imageNote.first(where: { $0.id == id }) {
            let index = imageNote.firstIndex(of: note)
        
            imageNote[index!].title = title
            imageNote[index!].description = description
        }
    }
    
    
    // MARK: reset data
    func resetUserData() {
        
        UserDefaults.standard.removeObject(forKey: "ImagesKey")
        UserDefaults.resetStandardUserDefaults()
        
        imageNote = []
    }
}

