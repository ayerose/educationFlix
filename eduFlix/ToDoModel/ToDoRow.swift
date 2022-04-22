//
//  ToDoRow.swift
//  eduFlix
//
//  Created by Reya on 14.04.22.
//

import SwiftUI

struct ToDoRow: View {
    var todo: String
    var done: Bool
    var body: some View {
        
        HStack(spacing: 20) {
            
            
            Image(systemName: done ? "checkmark.circle" : "circle")
            
            Text(todo)
            
            
        }
    }
}


struct ToDoRow_Previews: PreviewProvider {
    static var previews: some View {
        ToDoRow(todo: "Rewatch UX lecture", done: true)
    }
}
