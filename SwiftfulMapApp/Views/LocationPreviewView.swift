//
//  LocationPreviewView.swift
//  SwiftfulMapApp
//
//  Created by Lori Rothermel on 5/13/23.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var vm: LocationViewModel
    
    let location: Location
    
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }  // VStack
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }  // VStack
        }  // HStack
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )  // .background
        .cornerRadius(10)
        
    }  // some View
}  // LocationPreviewView


struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            LocationPreviewView(location: LocationsDataService.locations.first!)
                .padding()
        }  // ZStack
        .environmentObject(LocationViewModel())
    }
}


extension LocationPreviewView {

    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }  // ZStack
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }  // imageSection


    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }  // VStack
        .frame(maxWidth: .infinity, alignment: .leading)

    }  // titleSection


    private var learnMoreButton: some View {
        Button {
            vm.sheetLocation = location
        } label: {
            Text("Learn More")
                .font(.headline)
                .frame(width: 125, height: 35)
        }  // Button - Learn More
        .buttonStyle(.borderedProminent)
    }  // learnMoreButton


    private var nextButton: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }  // Button - Next
        .buttonStyle(.bordered)
    }  // nextButton

}
