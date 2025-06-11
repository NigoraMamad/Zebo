//
//  CameraOverlayView.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 10/06/25.
//


import SwiftUI
import AVFoundation

struct CameraOverlayView: View {
    @State private var session = AVCaptureSession()
    @State private var selectedSeason = "Spring"

    let seasons = ["Spring", "Summer", "Autumn", "Winter"]

    let paletteColors: [String: [String]] = [
        "Spring": ["SoftPeach", "CoralPink", "FreshMint", "SkyBlue"],
        "Summer": ["Lavender", "DustyRose", "CoolBlue", "SoftGray"],
        "Autumn": ["BurntOrange", "OliveGreen", "WarmBrown", "Beige"],
        "Winter": ["CrimsonRed", "JetBlack", "IcyBlue", "SnowWhite"]
    ]

    var body: some View {
        VStack(spacing: 0) {
            CameraPreview(session: session)
                .frame(height: UIScreen.main.bounds.height * 0.65)
                .onAppear {
                    configureCamera()
                }

            Picker("Season", selection: $selectedSeason) {
                ForEach(seasons, id: \.self) { season in
                    Text(season).tag(season)
                }
            }
            .pickerStyle(.segmented)
            .padding()

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(paletteColors[selectedSeason] ?? [], id: \.self) { colorName in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(colorName))
                            .frame(width: 60, height: 60)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                    }
                }
                .padding(.horizontal)
            }

            Spacer()
        }
        .navigationTitle("Live Preview")
        .navigationBarTitleDisplayMode(.inline)
    }

    func configureCamera() {
        guard let device = AVCaptureDevice.default(for: .video),
              let input = try? AVCaptureDeviceInput(device: device) else {
            return
        }

        session.beginConfiguration()
        if session.canAddInput(input) {
            session.addInput(input)
        }

        let output = AVCaptureVideoDataOutput()
        if session.canAddOutput(output) {
            session.addOutput(output)
        }

        session.commitConfiguration()
        session.startRunning()
    }
}
