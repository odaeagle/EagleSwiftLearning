//
//  DownloadTaskCellView.swift
//  AsyncAwaitApp
//
//  Created by Eagle Diao on 2022-06-25.
//

import SwiftUI

struct DownloadTaskCellView: View {
    
    @State var task: DownloadTask
    
    var body: some View {
        ZStack {
            Button("") {
//                                onSelect(item)
            }
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(task.name).font(.title2)
                    Spacer().frame(width: 0, height: 0)
                    Text(task.url).font(.subheadline)
                    Spacer().frame(width: 0, height: 6)
                    ProgressBarView(progress: 20)
                        .cornerRadius(5)
                }
                .contentShape(Rectangle())
                
                Spacer().frame(width: 10, height: 0)
                Button("Cancel") {
//                    viewModel.cancelTask(task.id)
                }.buttonStyle(.borderedProminent)
            }
        }
    }
}

struct DownloadTaskCellView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadTaskCellView(
            task: .init(
                name: "A Big Image",
                url: "www.google.com",
                status: .finished,
                target: 1000
            )
        )
        .padding(10)
        .border(.red, width: 1)
    }
}
