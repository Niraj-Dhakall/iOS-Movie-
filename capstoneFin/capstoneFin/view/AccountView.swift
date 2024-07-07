import SwiftUI

struct AccountView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        NavigationView {
            
                Form {
                    Section(header: Text("Settings")) {
                        Toggle(isOn: $isDarkMode) {
                            Text("Dark Mode")
                        }
                        
                    }
                    
                }
            
            .navigationTitle("Account")
            
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
