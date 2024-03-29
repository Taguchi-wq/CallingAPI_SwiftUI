//
//  ContentView.swift
//  CallingAPI
//
//  Created by cmStudent on 2021/11/08.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.courses, id: \.self) { course in
                    CourseView(name: course.name, image: course.image)
                }
            }
            .navigationTitle("Courses")
            .listStyle(PlainListStyle())
            .onAppear { viewModel.fetchCourses() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
