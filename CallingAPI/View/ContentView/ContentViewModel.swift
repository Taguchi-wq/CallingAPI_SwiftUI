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
        NetworkManager.shared.fetch(url, type: [Courses].self) { result in
            switch result {
            case .success(let courses):
                self.courses = courses
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
