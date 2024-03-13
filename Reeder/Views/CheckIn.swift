//
//  CheckIn.swift
//  Reeder
//
//  Created by niein on 2024/3/13.
//

import SwiftUI
import MapKit

struct CheckIn: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        Map(coordinateRegion: $locationManager.region)
    }
}

#Preview {
    CheckIn()
}
