//
//  MainView.swift
//  eduFlix
//
//  Created by Reya on 14.04.22.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var imageData : ImageData
    var body: some View {
        
        // display the array
        List {
            ForEach(imageData.imageNote) { note in
                NavigationLink(destination: NoteView(note: note)) {
                    HStack {
                        Image(uiImage: UIImage(data: note.image)!)
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                        
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .lineLimit(2)
                        }
                        .position(x: 100, y: 100)
                    }
                }
            }
        }
        .background(Color(hue: 0.26, saturation: 0.101, brightness: 0.9))
       
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ImageData())
    }
}
