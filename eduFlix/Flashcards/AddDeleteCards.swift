//
//  AddDeleteCards.swift
//  eduFlix
//
//  Created by Reya on 14.04.22.
//

import SwiftUI

struct AddDeleteCards: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var cards = [Card]()
    @State private var addNewPrompt = ""
    @State private var addNewAnswer = ""
    @State private var addedCard : Bool = false
    
    
    var body: some View {

        NavigationView {
           
            List {
                Section("Add New Card") {
                    TextField("Prompt", text: $addNewPrompt)
                    TextField("Answer", text: $addNewAnswer)
                }
                    Button {
                        self.addedCard = true
                        
                    } label: {
                        Text("Add Card")
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(Color(hue: 0.569, saturation: 0.796, brightness: 0.408))
                            .cornerRadius(40)
                        
                            .alert(isPresented: $addedCard) {
                                Alert(title: Text("Success"), message: Text("Your Card was added!"), dismissButton: .default(Text("OK"), action: {
                                    dismiss()
                                })
                                )
                           
                            }
                    }

                   // Button("Add your card", action: addCard)
                
                Section {
                    ForEach(0..<cards.count, id: \.self) {
                        index in VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                                .font(.headline)
                            
                            Text(cards[index].answer)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
           
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done", action: done)
            }
            .listStyle(.grouped)
            .onAppear(perform: loadData)
            
        }
        
        
    }
    
    
    func done() {
        dismiss()
    }
    
    //MARK: read data
    func loadData(){
        // read data
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
                
            
        }
    }
    //MARK: save data
    func saveData() {
        if let data = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(data, forKey: "Cards")
        }
    }
    //MARK: add card
    func addCard() {
        let trimmedPrompt = addNewPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = addNewAnswer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else {return}
        
        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        saveData()
        
        
    }
    
    //MARK: remove card
    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        saveData()
    }
}

struct AddDeleteCards_Previews: PreviewProvider {
    static var previews: some View {
        AddDeleteCards()
    }
}
