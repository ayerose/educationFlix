//
//  FlashCardsView.swift
//  eduFlix
//
//  Created by Reya on 13.04.22.
//

import SwiftUI

struct FlashCardsView: View {
    
    // add vibration
    @State private var feedback = UINotificationFeedbackGenerator()
    let card: Card
    var removeCard: (() -> Void)? = nil
    
    // accessibilty
    @Environment(\.accessibilityDifferentiateWithoutColor) var withoutColorDifferentiate
    @Environment(\.accessibilityVoiceOverEnabled) var enableVoiceover
    
    @State private var showAnswer = false
    @State private var offset = CGSize.zero
    
    var body: some View {
        

        // create card
        
        ZStack {
            // change color to red if user swipes card to left and turn green if swiped right
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    //if Differentiate without color use full white else use white with opacity
                    withoutColorDifferentiate
                       ? .white
                       : .white
                        .opacity(2-Double(abs(offset.width / 50))))
            
                .background(
                    //if Differentiate use no background
                    withoutColorDifferentiate
                    ? nil
                    :  RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(offset.width > 0 ? .green : .red)
                )
                .shadow(radius: 10)
               
            
            VStack {
                // MARK: Voice over accessibility
                if enableVoiceover {
                    Text(showAnswer ? card.answer : card.prompt)
                    
                } else {
                Text(card.prompt)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(Color("ColorGreenLight"))
                
                Divider()
                
                if showAnswer {
                    Text(card.answer)
                        .font(.title)
                        .foregroundColor(.gray)
                }
                }
                
            }
            .padding()
            .multilineTextAlignment(.center)
            
        }
        
        .frame(width: 340, height: 500)
//        .background(Image("backgroundgreen").frame(width: 100, height: 100))
        // add rotation
        .rotationEffect(.degrees(Double(offset.width/5)))
        //add movement
        .offset(x: offset.width * 5, y: 0)
        // fade away card
        .opacity(2-Double(abs(offset.width / 50)))
        .accessibilityAddTraits(.isButton)
        
        // MARK: position
      //  .position(x: 10, y: 10)
        
        
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    feedback.prepare()
                }
                .onEnded {
                    _ in
                    if abs(offset.width) > 100 {
                        
                        // if card was guessed wrong play vibration
                        if offset.width < 0 {
                            
                            feedback.notificationOccurred(.error)
                        }
                        //remove card
                        removeCard?()
                    } else {
                        offset = .zero
                    }
                })
            
        .onTapGesture {
            showAnswer.toggle()
                
        }
    }
        
}

struct FlashCardsView_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardsView(card: Card.example)
    }
}
