//
//  ContentView.swift
//  assign4
//
//  Created by Meisheng Liu on 11/5/21.
//

import SwiftUI
import CoreData
import CoreLocation
import MapKit

extension CLLocationCoordinate2D : Identifiable {
    public var id : String {"\(latitude), \(longitude)"}
}

struct TrackTab: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Track.name, ascending: true)],
        animation: .default)
    private var tracks: FetchedResults<Track>
    
    func genPoints (track: Track) -> [CLLocationCoordinate2D] {
        var locArray : [CLLocationCoordinate2D] = []
        
        for p in track.points! {
            if let point = p as? Point {
                let loc = CLLocationCoordinate2D(latitude: point.latitude, longitude: point.longitude)
                locArray.append(loc)
            }
        }
        
        return locArray
    }
    
    func setMinMaxLat(track: Track) -> (Double, Double) {
        var minLat = 90.0
        var maxLat = -90.0
        
        for p in track.points! {
            if let point = p as? Point {
                if point.latitude < minLat {
                    minLat = point.latitude
                }
                
                if point.latitude > maxLat {
                    maxLat = point.latitude
                }
            }
        }
        
        return (minLat, maxLat)
    }
    
    func setMinMaxLong(track: Track) -> (Double, Double) {
        var minLong = 180.0
        var maxLong = -180.0
        
        for p in track.points! {
            if let point = p as? Point {
                if point.longitude < minLong {
                    minLong = point.longitude
                }
                
                if point.longitude > maxLong {
                    maxLong = point.longitude
                }
            }
        }
        
        return (minLong, maxLong)
    }
    
    func setRegion(track: Track) -> MKCoordinateRegion {
         let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0.5 * (setMinMaxLat(track: track).1 + setMinMaxLat(track: track).0), longitude: 0.5 * (setMinMaxLong(track: track).1 + setMinMaxLong(track: track).0)), span: MKCoordinateSpan(latitudeDelta: 1.5 * (setMinMaxLat(track: track).1 - setMinMaxLat(track: track).0), longitudeDelta: 1.5 * (setMinMaxLong(track: track).1 - setMinMaxLong(track: track).0)))
        
        return region
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tracks) { track in
                    NavigationLink {
                        TrackView(region: setRegion(track: track), array: genPoints(track: track))
                        Text("\(track.name!) \(track.time!), \(genPoints(track:track).count) points")
                    } label: {
                        Text("\(track.name!) \(track.time!)")
                    }
                }
                .onDelete(perform: deleteItems)
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { tracks[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView: View {
    @State private var tabSelection = 1
    
    var body: some View {
        TabView (selection: $tabSelection) {
            MapView(tabSelection: $tabSelection).tabItem {
                Text("Map")
            }.tag(1)
            
            TrackTab().tabItem {
                Text("Saved Tracks")
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
