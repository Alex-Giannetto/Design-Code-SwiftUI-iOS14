//
//  CourseRow.swift
//  DesignCodeCourse
//
//  Created by Alex on 01/01/2021.
//

import SwiftUI

struct CourseRow: View {
    var item: CourseSection
    
    var body: some View {
        HStack(alignment: .top) {
            Image(item.logo)
                .renderingMode(.original)
                .frame(width: 48, height: 48)
                .imageScale(.medium)
                .background(item.color)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 6.0){
                Text(item.title)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.primary)
                
                Text(item.subtitle)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
    }
}

struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            CourseRow(item: courseSections[0])
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            CourseRow(item: courseSections[0])
                .preferredColorScheme(.dark)
        }
    }
}
