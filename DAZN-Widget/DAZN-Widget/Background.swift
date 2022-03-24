import Foundation
import SwiftUI

struct BackgroundImage: ViewModifier {
    
    let lightGreyColor = Color(red: 8.0/255.0, green: 23.0/255.0, blue: 29.0/255.0, opacity: 1.0)
    
    func body(content: Content) -> some View {
        content
            .background {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width*1, height: UIScreen.main.bounds.height*1)
                    .foregroundColor(lightGreyColor)
            }
    }
}

extension View {
    func backgroundImage() -> some View {
        modifier(BackgroundImage())
    }
}
