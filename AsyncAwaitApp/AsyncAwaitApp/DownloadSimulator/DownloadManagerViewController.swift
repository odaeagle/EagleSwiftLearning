import SwiftUI
import UIKit

struct DownloadSimulatorView: View {
    
    @StateObject var viewModel: DownloadManagerViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            List {
                Section("Demos") {
                    ForEach(viewModel.tasks) { task in
                        DownloadTaskCellView(task: task)
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                    }
                }
            }.listStyle(.plain)
        }
    }
}

struct DownloadSimulatorView_Previews: PreviewProvider {
    
    static var previews: some View {
        DownloadSimulatorView(viewModel: DownloadManagerViewModel())
    }
}

class DownloadManagerViewController: UIHostingController<DownloadSimulatorView> {
    
    required init() {
        super.init(rootView: DownloadSimulatorView(viewModel: DownloadManagerViewModel()))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Download Manager"
    }
    
}

