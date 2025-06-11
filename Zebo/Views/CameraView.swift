//
//  CameraView.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 11/06/25.
//


import SwiftUI
import AVFoundation

struct CameraView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CameraViewController {
        return CameraViewController()
    }

    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {}
}
