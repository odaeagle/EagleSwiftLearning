//
//  ProgressBarView.swift
//  AsyncAwaitApp
//
//  Created by Eagle Diao on 2022-06-25.
//

import SwiftUI

struct ProgressBarView: View {
    
    @State var progress: CGFloat
    @State var height: CGFloat = 10
    @State var progressBackgroundColor: Color = .red
    @State var progressForegroundColor: Color = .green
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(height: height)
                .foregroundColor(progressBackgroundColor)
            Rectangle()
                .frame(width: 10, height: height)
                .foregroundColor(progressForegroundColor)
        }
    }
    
    
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(
            progress: 25,
            height: 10,
            progressBackgroundColor: .black,
            progressForegroundColor: .red
        ).cornerRadius(5)
    }
}
