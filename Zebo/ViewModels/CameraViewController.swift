//
//  CameraViewController.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 11/06/25.
//


import UIKit
import AVFoundation
import Vision
import CoreML

class CameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    private let session = AVCaptureSession()
    private var previewLayer: AVCaptureVideoPreviewLayer!
    var viewModel: SeasonViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCamera()
    }

    private func configureCamera() {
        session.sessionPreset = .photo

        guard let camera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
              let input = try? AVCaptureDeviceInput(device: camera),
              session.canAddInput(input) else {
            return
        }

        session.addInput(input)

        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = view.bounds
        view.layer.addSublayer(previewLayer)

        let output = AVCaptureVideoDataOutput()
        output.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        session.addOutput(output)

        session.startRunning()
    }

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }

        let request = VNDetectFaceRectanglesRequest { [weak self] request, error in
            guard let observations = request.results as? [VNFaceObservation],
                  let face = observations.first else { return }

            self?.processFaceObservation(face, in: pixelBuffer)
        }

        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .leftMirrored)
        try? handler.perform([request])
    }

    func processFaceObservation(_ face: VNFaceObservation, in pixelBuffer: CVPixelBuffer) {
        let ciImage = CIImage(cvPixelBuffer: pixelBuffer)

        let width = CGFloat(CVPixelBufferGetWidth(pixelBuffer))
        let height = CGFloat(CVPixelBufferGetHeight(pixelBuffer))

        let faceRect = CGRect(
            x: face.boundingBox.origin.x * width,
            y: (1 - face.boundingBox.origin.y - face.boundingBox.size.height) * height,
            width: face.boundingBox.size.width * width,
            height: face.boundingBox.size.height * height
        )

        let cropped = ciImage.cropped(to: faceRect)
        let context = CIContext()

        if let cgImage = context.createCGImage(cropped, from: cropped.extent) {
            classifySeason(with: cgImage)
        }
    }

    func classifySeason(with image: CGImage) {
        guard let model = try? VNCoreMLModel(for: SeasonClassifier().model) else {
            print("⚠️ Failed to load model")
            return
        }

        let request = VNCoreMLRequest(model: model) { [weak self] request, error in
            guard let results = request.results as? [VNClassificationObservation],
                  let top = results.first else { return }

            DispatchQueue.main.async {
                let predictedSeason = top.identifier
                print("🧠 ML Predicted: \(predictedSeason)")
                self?.viewModel?.updateSeason(to: predictedSeason)
            }
        }

        let handler = VNImageRequestHandler(cgImage: image, options: [:])
        try? handler.perform([request])
    }
}
