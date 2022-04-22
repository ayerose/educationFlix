//
//  Extension.swift
//  eduFlix
//
//  Created by Reya on 19.04.22.
//

import Foundation
import SwiftUI

extension Double {
    // roubnd double to 0 decimals
    func roundUpDouble() -> String {
        return String(format: "%.0".self)
    }
}
    
    // Extension for adding rounded corners to specific corners
    extension View {
        func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
            clipShape(RoundedCorner(radius: radius, corners: corners) )
        }
    }
    // Custom RoundedCorner shape used for cornerRadius extension above
    struct RoundedCorner: Shape {
        var radius: CGFloat = .infinity
        var corners: UIRectCorner = .allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    
    
}
