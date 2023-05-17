//
//  LocationViewModel.swift
//  SwiftfulMapApp
//
//  Created by Lori Rothermel on 5/13/23.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject {
    // All loaded locations
    @Published var locations: [Location]
    // Current location on the map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }  // didSet
    }  // mapLocation
    
    // Current region on the map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Show list of locations
    @Published var showLocationsList: Bool = false
    
    // Show location detail via sheet
    @Published var sheetLocation: Location? = nil
    
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates,
                                           span: mapSpan)
        }
    }  // updateMapRegion
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
//            showLocationsList = !showLocationsList
            showLocationsList.toggle()
        }  // withAnimation
        
    }  // toggleLocationsList
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }  // withAnimation
    }  // showNextLocation
    
    
    func nextButtonPressed() {
        // Get the current index
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation }) else {
            print("Could NOT find current Index in locations array!")
            return
        }  // guard let
        
        
        // Check if currentIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // Next index is NOT valid
            // Restart from 0
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }  // guard
        
        // Next index is VALID
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
        
    }  // nextButtonPressed
    
    
    
    
    
}  // class LocationViewModel
