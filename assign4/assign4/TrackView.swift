//
//  TrackView.swift
//  assign4
//
//  Created by Meisheng Liu on 11/7/21.
//

import SwiftUI
import MapKit

struct TrackView: View {
    @State var region : MKCoordinateRegion
    var array : [CLLocationCoordinate2D]
    
    var body: some View {
        Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: false,  userTrackingMode: .constant(.none), annotationItems: array) {
            MapAnnotation(coordinate: $0, content: {
                Circle().fill(Color.red).frame(width: 5, height: 5)
            })
        }
    }
}
