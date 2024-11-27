//
//  TestWidgetBundle.swift
//  TestWidget
//
//  Created by Péter Áron Tóth on 27/11/2024.
//

import WidgetKit
import SwiftUI

@main
struct TestWidgetBundle: WidgetBundle {
    var body: some Widget {
        TestWidget()
        TestWidgetLiveActivity()
    }
}
