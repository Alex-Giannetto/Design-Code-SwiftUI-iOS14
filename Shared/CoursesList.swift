//
//  CoursesList.swift
//  DesignCodeCourse
//
//  Created by Alex on 01/01/2021.
//

import SwiftUI

struct CoursesList: View {
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        content
            .listStyle(InsetGroupedListStyle())
        #else
        content
            .frame(minWidth: 800, minHeight: 600)
        #endif
    }
    
    var content : some View {
        List(courseSections) { item in
            CourseRow(item: item)
        }
        .navigationTitle("Courses")
    }
}

struct CoursesList_Previews: PreviewProvider {
    static var previews: some View {
        CoursesList()
    }
}
