//
//  CheckIn.swift
//  Reeder
//
//  Created by niein on 2024/3/13.
//

import SwiftUI
import MapKit

struct CheckIn: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Entity.timestamp, ascending: false)], animation: .default)
    var checkIns: FetchedResults<Entity>
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checkIns) { checkIn in
                    CheckInRow(region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: checkIn.latitude, longitude: checkIn.longtitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)), date: "日期")
                }
            }
            .navigationTitle("Check in")
            .toolbar {
                Button(action: {
                    Vibration.selection.vibrate()
                    newCheckIn()
                }, label: {
                    RoundButton(text: "Check", image: "checkmark")
                })
            }
        }
    }
    
    func newCheckIn() {
        let new = Entity(context: viewContext)
        new.timestamp = Date()
        new.latitude = locationManager.region.center.latitude
        new.longtitude = locationManager.region.center.longitude
        try? viewContext.save()
    }
}

#Preview {
    CheckIn()
}
