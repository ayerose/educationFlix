//
//  ToDosView.swift
//  eduFlix
//
//  Created by Reya on 13.04.22.
//

import SwiftUI
import UIKit

struct ToDosView: View {
    @EnvironmentObject var realmManager: RealmManager
    
    @State private var showAddToDoView = false
    var body: some View {
        VStack {
            Text("ToDo List").font(.largeTitle)
                .font(.title3).bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading) .font(.system(.title, design: .rounded))
                .font(.system(size: 10))
                
                .foregroundColor(Color("Orange"))
            Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                .fontWeight(.light)
            List {
                
                ForEach(realmManager.tasks, id: \.id) {
                    task in
                    
                    if !task.isInvalidated {
                        ToDoRow(todo: task.title, done: task.completed)
                        //mark as completedd
                            .onTapGesture {
                                realmManager.updateTodo(id: task.id, completed: !task.completed)
                            }
                        
                        // swipe left to delete
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    realmManager.deleteTodo(id: task.id)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        
                    }
                    
                }
                .listRowSeparator(.hidden)
            }
            
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.26, saturation: 0.101, brightness: 0.9))
        
        
        
        ZStack(alignment: .bottomTrailing) {
            AddBtn()
                .padding()
                .onTapGesture {
                    showAddToDoView.toggle()
                }
            
        }
        .sheet(isPresented: $showAddToDoView) {
            AddToDoView()
                .environmentObject(realmManager)
        }
    }
}

struct ToDosView_Previews: PreviewProvider {
    static var previews: some View {
        ToDosView()
            .environmentObject(RealmManager())
    }
}
