//
//  CourseView.swift
//  CallingAPI
//
//  Created by cmStudent on 2021/11/08.
//

import SwiftUI

struct CourseView: View {
    
    let name: String
    let image: String
    
    var body: some View {
        HStack {
            URLImage(urlString: image)
            
            Text(name)
                .bold()
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView(name: "Building TikTok for iOS (Swift 5 + Firebase)",
                   image: "https://iosacademy.io/assets/images/courses/tiktok.png")
            .previewLayout(.sizeThatFits)
    }
}
