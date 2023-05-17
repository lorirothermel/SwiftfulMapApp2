//
//  LocationsListView.swift
//  SwiftfulMapApp
//
//  Created by Lori Rothermel on 5/13/23.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var vm: LocationViewModel


    var body: some View {
        List {
            ForEach(vm.locations) { location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }  // Button
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }  // ForEach
        }  // List
        .listStyle(.plain)
    }  // some View
}  // LocationsListView

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationViewModel())
    }
}

extension LocationsListView {

    private func listRowView(location: Location) -> some View {
        HStack {
            if let imagename = location.imageNames.first {
                Image(imagename)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }  // if let
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }  // VStack
            .frame(maxWidth: .infinity, alignment: .leading)
        }  // HStack
    }  // listRowView


}

