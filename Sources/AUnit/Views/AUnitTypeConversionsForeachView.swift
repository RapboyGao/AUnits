import SwiftUI

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
public struct AUnitTypeConversionsForeachView: View {
    @Binding var unitType: AUnitType
    @State private var value: Double?

    var digits: Int

    @AppStorage("18E422F5-8307-47ED-AD8E-434402A64A35 unitValues")
    private var storedData: Data?

    private func loadValue() {
        let jsonDecoder = JSONDecoder()
        guard let data = storedData,
              let dictionary = try? jsonDecoder.decode([AUnitType: Double].self, from: data)
        else { return }
        value = dictionary[unitType]
    }

    private func saveValue() {
        let jsonDecoder = JSONDecoder()
        var dictionary = (try? jsonDecoder.decode([AUnitType: Double].self, from: storedData ?? Data())) ?? [:]
        dictionary[unitType] = value
        storedData = try? JSONEncoder().encode(dictionary)
    }

    private var allUnits: [AUnit] {
        unitType.allUnits
    }

    public var body: some View {
        ForEach(allUnits) { unit in
            AUnitInputHStackFixedUnit(value: $value, unit: unit, originalUnit: unitType.baseUnit, digits: 10, placeholder: unit.shortName)
        }
        .onAppear {
            loadValue()
        }
        .onDisappear {
            saveValue()
        }
    }

    init(unitType: Binding<AUnitType>, digits: Int = 10) {
        _unitType = unitType
        self.digits = digits
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
#Preview {
    NavigationView {
        List {
            ForEach(AUnitType.allCases) { unitType in
                Section(unitType.shortName) {
                    AUnitTypeConversionsForeachView(unitType: .constant(unitType))
                }
            }
        }
    }
}
