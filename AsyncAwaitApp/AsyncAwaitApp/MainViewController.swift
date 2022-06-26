//
//  ViewController.swift
//  AsyncAwaitApp
//
//  Created by Eagle Diao on 2022-06-22.
//

import UIKit
import SwiftUI


private enum MenuItem: String, Identifiable, CaseIterable {
    var id: String {
        self.rawValue
    }
    
    case raceCondition
    case downloadSimulator
    case option3
    case option4
    
    var title: String {
        switch self {
        case .raceCondition:
            return "Race Condition"
        case .downloadSimulator:
            return "Download Simulator"
        default:
            return "TODO"
        }
    }
    
    var description: String {
        switch self {
        case .raceCondition:
            return "Show case the difference between Actor & Class"
        case .downloadSimulator:
            return "Simulate a download manager"
        default:
            return "TODO"
        }
    }
}

private struct MainView: View {
    
    let onSelect: (MenuItem) -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            List {
                Section("Demos") {
                    ForEach(MenuItem.allCases) { item in
                        ZStack {
                            Button("") {
                                onSelect(item)
                            }
                            VStack(alignment: .leading, spacing: 5) {
                                Text(item.title).font(.title2)
                                Text(item.description).font(.subheadline)
                            }
                            .contentShape(Rectangle())
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                        }
                    }
                }
            }.listStyle(.plain)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(onSelect: { _ in })
    }
}


class MainViewController: UIViewController {
    
    private lazy var hosting = UIHostingController(rootView: MainView(onSelect: { [weak self] in
        self?.navigateTo(item: $0)
    }))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Async/Await Playground"
        addChild(hosting)
        view.addSubview(hosting.view)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        hosting.view.frame = view.bounds
    }
    
    private func navigateTo(item: MenuItem) {
        switch item {
        case .raceCondition:
            let controller = BankAccountViewController()
            navigationController?.pushViewController(controller, animated: true)
        case .downloadSimulator:
            let controller = DownloadManagerViewController()
            navigationController?.pushViewController(controller, animated: true)
        default:
            break
        }
    }
}

