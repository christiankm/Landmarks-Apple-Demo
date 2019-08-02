//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Christian Mitteldorf on 02/08/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {

    @Binding var profile: Profile

    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }

    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }

            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }

            VStack(alignment: HorizontalAlignment.leading, spacing: 20) {
                Text("Seasonal Photo").bold()

                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    Text("Summer")
//                    ForEach(Profile.Season.allCases.identified(by: \.self)) { season in
//                        Text(season.rawValue).tag(season)
//                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.top)

            VStack(alignment: .leading, spacing: 30) {
                Text("Goal Date").bold()
                DatePicker("Goal Date", selection: $profile.goalDate, in: dateRange, displayedComponents: .date)
            }
            .padding(.top)
        }
    }
}

#if DEBUG
struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
#endif
