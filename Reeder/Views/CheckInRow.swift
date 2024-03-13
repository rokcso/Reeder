//
//  CheckInRow.swift
//  Reeder
//
//  Created by rokcso on 2024/3/13.
//

import SwiftUI
import MapKit

struct CheckInRow: View {
    @State var region: MKCoordinateRegion
    var date: String
    
    var body: some View {
        HStack {
            Map(coordinateRegion: $region)
                .frame(width: 100, height: 100)
                .cornerRadius(100)
                .padding(.trailing, 10)
            Text(date)
                .font(.title)
                .fontWeight(.semibold)
            Spacer()
        }
        .padding()
    }
}
//
//#Preview {
//    CheckInRow()
//}
