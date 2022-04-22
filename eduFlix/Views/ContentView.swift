//
//  ContentView.swift
//  eduFlix
//
//  Created by Reya on 09.04.22.
//

import SwiftUI

// create card stack, user will be able to see the lining of them and how many cards are left


extension View {
    
    
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 10)


    }
}
    
struct ContentView: View {
   
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var withoutColorDifferentiate
    
    // timer
    @State private var timeRemaining = 60
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.scenePhase) var phaseScene
    @State private var isActive = true // 
    
    let card: Card
    var removeCard: (() -> Void)? = nil
    
    @State private var showAnswer = false
    @State private var offset = CGSize.zero
    
    //edit cards
    @State private var showEdit = false
    
   

  @State private var cards = [Card]()
    //Array<Card>(repeating: Card.example, count: 10)
    
    var body: some View {
       // NavigationView {
    
            
        ZStack {
            Image("")
            
            VStack {
                Text("Flashcards").font(.largeTitle)
                    .font(.title3).bold()
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading) .font(.system(.title, design: .rounded))
                    .font(.system(size: 10))
                    
                    .foregroundColor(Color("Orange"))
                
                Text("Time: \(timeRemaining)").fontWeight(.light).italic()
                   // .font(.largeTitle)
                    .font(.title3).bold()
                    .foregroundColor(.black)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                  //  .background(.purple.opacity(0.75))
                    .clipShape(Capsule())
                    
                
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in FlashCardsView(card: cards[index]) {
                        withAnimation {
                            removeCard(at: index)
                        }
                        
                    }
                            .stacked(at: index, in: cards.count)
                        // avoid user being able to swipe other cards than the on on the front (last card)
                            .allowsHitTesting(index == cards.count - 1)
                            .accessibilityHidden(index < cards.count - 1)
                    }
                }
                // as long as time > 0 allow swiping
                .allowsHitTesting(timeRemaining > 0)
            }
            
            // show try again btn when cards are empty
            if cards.isEmpty {
                Button("Try Again?", action: resetFlashcards)
                    .padding()
                    .background(.white)
                    .foregroundColor(.orange)
                    .clipShape(Capsule())
                  //  .offset(x: 100.0, y: -90)
            
            
        }
            // MARK: EDIT CARDS BUTTON
            VStack {
                HStack {
                    

                    //Spacer()
                    
                    Button {
                        showEdit = true
                       
                    } label: {
                        Image(systemName: "plus.circle")
                            .padding()
                            .background(.blue.opacity(1))
                            .clipShape(Circle())
                     
                        
                            //.position(x: 200, y: -200)
                            //.offset(x: 120.0, y: -270.0)
                           //.frame(width: 160, height: 160)
                        
                        
                    }
                    
                }
                
            }
            .foregroundColor(.white)
            .font(.largeTitle)
       
           .padding()
            
            //MARK: ACCESSIBILITY
            
            if withoutColorDifferentiate {
                
                VStack {
                    Spacer()
                    HStack {
                        Button {
                            withAnimation {
                                removeCard(at: cards.count - 1)
                            }
                        } label: {
                        Image(systemName: "note.text")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(Circle())
                            .position(x: 20, y: 500)
                        }
                        .accessibilityLabel("Wrong")
                        .accessibilityHint("Mark your answer as incorrect")
                        
                        Spacer()
                        Button {
                            withAnimation {
                                removeCard(at: cards.count - 1)
                          }
                        }label: {

                        Image(systemName: "checkmark.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(Circle())
                    }
                        .accessibilityLabel("Correct")
                        .accessibilityHint("Mark your answer as correct")
                    }
                    
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                }
            }

    } .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hue: 0.26, saturation: 0.101, brightness: 0.9))
       
      //  }
            
            // MARK: TIMER
        .onReceive(timer) { time in
            guard isActive else {return} // dont countdown if user goes out of app - > stop timer
            
        if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: phaseScene) { newPhase in
            if newPhase == .active {
                //reactivate timer if cards are in array again
                if cards.isEmpty == false {
                isActive = true
            }
            } else {
                isActive = false
            }
        }
        // MARK: show AddDeleteCards window
        
        .sheet(isPresented: $showEdit, onDismiss: resetFlashcards, content: AddDeleteCards.init)
        .onAppear(perform: resetFlashcards)
       // .navigationTitle("Flashcards")
        }
    
    
    //MARK: load cards from user defaulfts
    func loadData(){
        // read data
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
                
            
        }
    }

    // MARK: REMOVE CARD
    // to avoid removing non existent cards -> GUARD
    func removeCard(at index: Int) {
        
        guard index >= 0 else {
            return }
        
        cards.remove(at: index)
        if cards.isEmpty {
            isActive = false
        }
    }
    
    
    func resetFlashcards() {
       // cards = Array<Card>(repeating: Card.example, count: 10)
        timeRemaining = 100
        isActive = true
        loadData()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(card: Card.example)
.previewInterfaceOrientation(.portrait)
    }
}

