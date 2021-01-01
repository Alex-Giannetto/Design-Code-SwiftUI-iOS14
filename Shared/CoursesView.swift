//
//  CoursesView.swift
//  DesignCodeCourse
//
//  Created by Alex on 01/01/2021.
//

import SwiftUI

struct CoursesView: View {
    var body: some View {
        List(0 ..< 20) { item in
            CourseRow()
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
            .preferredColorScheme(.dark)
    }
}
