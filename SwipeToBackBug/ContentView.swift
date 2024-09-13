//
//  ContentView.swift
//  SwipeToBackBug
//
//  Created by daniiorlov on 13.09.2024.
//

import SwiftUI
import UIKit

/// Разрешаем свайп для экранов со скрытым нативном навигейшен баром
extension UINavigationController: UIGestureRecognizerDelegate {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    open func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        viewControllers.count > 1
    }

    open func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
    ) -> Bool {
        true
    }

    public func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer
    ) -> Bool {
        otherGestureRecognizer.state != .changed
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: DetailView()) {
                Text("Go to Detail")
            }
            .navigationTitle("iOS 17.0 - 17.3")
        }
    }
}

struct DetailView: View {
    var body: some View {
        VStack {
            Text("Detail View")

            NavigationLink("Freeze") {
                Text("Freeze")
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    ContentView()
}
