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
                    CheckInRow(region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: checkIn.latitude, longitude: checkIn.longtitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)), locationManager: locationManager, date: displayDate(checkIn.timestamp!))
                }
                .onDelete(perform: { indexSet in
                    indexSet.forEach { index in
                        let checkIn = checkIns[index]
                        viewContext.delete(checkIn)
                    }
                    try? viewContext.save()
                })
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
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "zh_Hans")
        formatter.setLocalizedDateFormatFromTemplate("MMMMdd")
        return formatter
    }()
    
    func displayDate(_ date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}

#Preview {
    CheckIn()
}
