//
//  AddToDoView.swift
//  eduFlix
//
//  Created by Reya on 14.04.22.
//

import SwiftUI

struct AddToDoView: View {
    
    @EnvironmentObject var realmManager: RealmManager
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var toDoAdded: Bool = false
    
    var body: some View {
      
        VStack(alignment: .leading, spacing: 20) {
            Text("Add new ToDo").font(.largeTitle)
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color("Orange"))
            
            
            
            TextField("Enter your ToDo", text: $title)
                .textFieldStyle(.roundedBorder)
            
            // MARK: create alert when todo is added
            Button(action: {
                self.toDoAdded = true
                if title != "" {
                    realmManager.addTask(taskName: title)

                }
                dismiss()
            }, label: {
                Text("Add")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(hue: 0.569, saturation: 0.796, brightness: 0.408))
                    .cornerRadius(40)
                //alert
                    .alert(isPresented: $toDoAdded) {
                        Alert(title: Text("Success"), message: Text("Your ToDo was added!"), dismissButton: .default(Text("OK"), action: {
                            dismiss()
                        })
                        )
                   
                    }
                
                // print("ToDo was added!")
                 
                
            })
         
               
                
                
            }.padding(.top, 40)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hue: 0.26, saturation: 0.101, brightness: 0.9))
           
                   
                   
            Spacer()
                
            
        }//.background(Color(hue: 0.26, saturation: 0.141, brightness: 0.9))
            
          
            
    }


struct AddToDoView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoView()
            .environmentObject(RealmManager())
    }
}
