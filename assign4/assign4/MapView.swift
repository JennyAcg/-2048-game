//
//  MapView.swift
//  assign4
//
//  Created by Meisheng Liu on 11/7/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var locManager: Locationer
    @Environment(\.managedObjectContext) private var viewContext
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37, longitude: -67), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    @Binding var tabSelection: Int
    @State var showStopButton = false
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Track.name, ascending: true)],
        animation: .default)
    private var tracks: FetchedResults<Track>
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: locManager.locationsArray) {
                MapAnnotation(coordinate: $0, content: {
                    Circle().fill(Color.red).frame(width: 5, height: 5)
                })
            }
            
            if !showStopButton {
                Button("Start", action: {
                    locManager.isStart = true
                    showStopButton.toggle()
                })
                    .frame(width: 100.0, height: 39.0)
                    .border(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, width: 2)
                    .cornerRadius(1)
            }
            
            if showStopButton {
                Button("Stop", action: {
                    locManager.isStart = false
                    addItem()
                    showStopButton.toggle()
                    locManager.locationsArray.removeAll()
                    tabSelection = 2
                })
                    .frame(width: 100.0, height: 39.0)
                    .border(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, width: 2)
                    .cornerRadius(1)
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            let newTrack = Track(context: viewContext)
            newTrack.name = "Track stored at time: "
            newTrack.time = Date().description
            
            for i in 0..<locManager.locationsArray.count {
                let newPoint = Point(context: viewContext)
                newPoint.latitude = locManager.locationsArray[i].latitude
                newPoint.longitude = locManager.locationsArray[i].longitude
                newTrack.addToPoints(newPoint)
            }
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
