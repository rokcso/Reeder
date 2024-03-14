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
    @Binding var displayMode: Int
    var date: String
    @State var city: String = ""
    @State var address: String = ""
    
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
                if displayMode == 1 {
                    Text(address)
                }
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            locationManager.lookUpCurrentLocation(location: CLLocation(latitude: region.center.latitude, longitude: region.center.longitude)) {
                placemark in
                city = (placemark?.locality) ?? "111"
                address = (placemark?.name) ?? "222"
            }
        }
    }
}
//
//#Preview {
//    CheckInRow()
//}
