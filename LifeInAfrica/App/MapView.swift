//
//  MapView.swift
//  LifeInAfrica
//
//  Created by Vedat Ozlu on 20.07.2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - PROPERTIES
    @State private var region : MKCoordinateRegion = {
        let mapCoordinate = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        let mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        let mapRegion = MKCoordinateRegion(center: mapCoordinate, span: mapZoomLevel)
        return mapRegion
    }()
    let locations : [NationalParkLocation] = Bundle.main.decode("locations.json")
    // MARK: - BODY
    var body: some View {
        // MARK: - 1 BASIC MAP
        // Map(coordinateRegion: $region)
        // MARK: - 2 ADVANCED MAP
        // region will be reseted after movement on the map
        Map(coordinateRegion: $region,annotationItems: locations) { item in
            // (A) PIN : Old style (always static)
            // MapPin(coordinate: item.location,tint: .accentColor)
            // (B) PIN : New style (always static)
            // MapMarker(coordinate: item.location,tint: .accentColor)
            // (C) Custom Basic Annotation (it could be interactive)
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32,height: 32,alignment: .center)
//            } // : Annotation
            // (D) Custom Advanced Annotation (it could be interactive)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        } // : Map
        .overlay(
            HStack(alignment : .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48,height: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude :")
                            .font(.footnote)
                            .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    } //: HStack
                    Divider()
                    HStack {
                        Text("Longitude :")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    } //: HStack
                } //: VStack
            } //: HStack
                .padding(.vertical,12)
                .padding(.horizontal,16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding()
            ,alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
