import SwiftUI
import UIKit

struct BankAccountView: View {
    
    @StateObject var viewModel: BankTransactionViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("Safe Bank:")
                    .font(.title)
                Spacer().frame(width: 0, height: 5)
                Text("$\(viewModel.safeBalance)").font(.system(size: 50))
                Spacer().frame(width: 0, height: 20)
                Text("Unsafe Bank:")
                    .font(.title)
                Spacer().frame(width: 0, height: 5)
                Text("$\(viewModel.unsafeBalance)").font(.system(size: 50))
                Spacer()
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .padding()
        }.overlay(
            VStack {
                Button("Start Deposit") {
                    viewModel.startDeposit()
                }.frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(25)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .buttonStyle(.borderedProminent)
                
                Text("""
Everytime you press the `Start Deposit` Button, we will call deposit function for 10000 times with $1 each time. Safe Bank is a actor, Unsafe Bank is a class.
"""
                ).padding(.leading, 20)
                    .padding(.trailing, 20)
                    .multilineTextAlignment(.center)
            },
            alignment: .bottom)
    }
}

struct BankAccountView_Previews: PreviewProvider {
    
    static var previews: some View {
        BankAccountView(viewModel: BankTransactionViewModel())
    }
}

class BankAccountViewController: UIHostingController<BankAccountView> {
    
    required init() {
        super.init(rootView: BankAccountView(viewModel: BankTransactionViewModel()))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Race Condition"
    }
    
}

