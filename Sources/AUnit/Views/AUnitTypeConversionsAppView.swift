import SwiftUI

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
public struct AUnitTypeConversionsAppView: View {
    public var body: some View {
        List {
            ForEach(AUnitType.allCases) { unitType in
                NavigationLink {
                    List {
                        Section(unitType.longName) {
                            AUnitTypeConversionsForeachView(unitType: .constant(unitType))
                        }
                    }
                    .navigationTitle(unitType.shortName)
                } label: {
                    Label(unitType.longName, systemImage: unitType.systemImage)
                }
            }
        }
    }

    public init() {}
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
#Preview {
    NavigationView {
        AUnitTypeConversionsAppView()
            .navigationTitle("Units")
    }
}
