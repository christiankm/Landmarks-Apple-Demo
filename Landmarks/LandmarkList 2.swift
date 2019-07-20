//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Christian Mitteldorf on 23/06/2019.
//  Copyright © 2019 Mitteldorf. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites Only")
                }
                ForEach(landmarkData) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)
                            .environmentObject(self.userData)
                        ) {
                            LandmarkRow(landmark: landmark)
                                .contextMenu {
                                    VStack {
                                        Button(action: {}) {
                                            HStack {
                                                Text("Make First")
                                                Image(systemName: "star")
                                            }
                                        }
                                        Button(action: {}) {
                                            HStack {
                                                Text("Remove")
                                                Image(systemName: "trash")
                                            }
                                        }
                                    }
                                }
                        }
                    }
                }
            }
        }.navigationBarTitle(Text("Landmarks"))
    }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"].identified(by: \.self)) { deviceName in
            LandmarkList()
                .environmentObject(UserData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
#endif
