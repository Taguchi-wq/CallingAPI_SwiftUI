//
//  URLImage.swift
//  CallingAPI
//
//  Created by cmStudent on 2021/11/08.
//

import SwiftUI

struct URLImage: View {
    
    @State var data: Data?
    
    let urlString: String
    
    var body: some View {
        if let data = data, let image = UIImage(data: data) {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 70)
                .background(Color.gray)
        } else {
            Image(systemName: "video")
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 70)
                .background(Color.gray)
                .onAppear {
                    fetchImageData()
                }
        }
    }
    
    private func fetchImageData() {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            self.data = data
            
        }.resume()
    }
    
}
