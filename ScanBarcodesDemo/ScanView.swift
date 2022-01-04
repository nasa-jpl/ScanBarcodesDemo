//
//  ScanView.swift
//  ScanBarcodesDemo
//
//  Created by Mark Powell on 12/8/21.
//

import SwiftUI
import ScanBarcodes

struct ScanView: View {
    @Binding var flashlightOn: Bool
    @Binding var zoomLevel: Int
    @State private var barcodeContent = "Scan a QR code"

    init(flashlightOn: Binding<Bool>, zoomLevel: Binding<Int>) {
        _flashlightOn = flashlightOn
        _zoomLevel = zoomLevel
    }

    var body: some View {
        VStack {
            HStack {
                Button {
                    self.flashlightOn.toggle()
                } label: {
                    Image(systemName: flashlightOn
                          ? "bolt.circle.fill" : "bolt.slash.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                Picker(selection: $zoomLevel, label: Text("Zoom")) {
                    ForEach(1...8, id: \.self) {
                        Text("\($0)x")
                    }
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .background(Color.black)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

            ScanBarcodesView(
                barcodeTypes: [.qr],
                zoomLevel: $zoomLevel,
                flashlightOn: $flashlightOn,
                completion: barcodeResult)

            Text(barcodeContent)
        }
    }

    private func barcodeResult(result: Result<String, BarcodeScanError>) {
        if case let .success(code) = result {
            barcodeContent = code
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView(flashlightOn: .constant(false), zoomLevel: .constant(1))
    }
}
