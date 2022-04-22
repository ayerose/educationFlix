


//
//  Card.swift
//  eduFlix
//
//  Created by Reya on 13.04.22.
//

import Foundation


struct Card: Codable {
    
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "What does the term ‘design-thinking’ mean?", answer: "Design thinking is a method for the generation of solutions and a practical, creative resolution of problems. It’s about uncovering insights into the unmet needs of your target audience.")
    
}
