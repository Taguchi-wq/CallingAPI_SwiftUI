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
                    HStack {
                        Image("")
                            .frame(width: 130, height: 70)
                            .background(Color.gray)
                        
                        Text(course.name)
                            .bold()
                    }
                }
            }
            .navigationTitle("Courses")
            .onAppear { viewModel.fetchCourses() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
