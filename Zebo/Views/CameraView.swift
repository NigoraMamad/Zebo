//
//  CameraView.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 11/06/25.
//


import SwiftUI
import AVFoundation

struct CameraView: UIViewControllerRepresentable {
    @ObservedObject var viewModel: SeasonViewModel

    func makeUIViewController(context: Context) -> CameraViewController {
        let controller = CameraViewController()
        controller.viewModel = viewModel
        return controller
    }

    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {}
}

