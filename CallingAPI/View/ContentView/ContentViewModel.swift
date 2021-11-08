//
//  ContentViewModel.swift
//  CallingAPI
//
//  Created by cmStudent on 2021/11/08.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    @Published var courses: [Courses] = []
    
    func fetchCourses() {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let courses = try JSONDecoder().decode([Courses].self, from: data)
                self.courses = courses
            } catch {
                print(error)
            }
        }.resume()
    }
    
}
