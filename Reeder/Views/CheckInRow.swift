//
//  CheckInRow.swift
//  Reeder
//
//  Created by rokcso on 2024/3/13.
//

import SwiftUI
import MapKit
import CoreLocation

struct CheckInRow: View {
    @State var region: MKCoordinateRegion
    @ObservedObject var locationManager: LocationManager
    @State var city: String = ""
    var date: String
    
    var body: some View {
        HStack {
            Map(coordinateRegion: $region)
                .frame(width: 100, height: 100)
                .cornerRadius(100)
                .padding(.trailing, 10)
            VStack {
                Text(city)
                    .font(.title)
                    .fontWeight(.semibold)
                Text(date)
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            locationManager.lookUpCurrentLocation(location: CLLocation(latitude: region.center.latitude, longitude: region.center.longitude)) {
                placemark in
                city = (placemark?.locality) ?? "111"
            }
        }
    }
}
//
//#Preview {
//    CheckInRow()
//}
