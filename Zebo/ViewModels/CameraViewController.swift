//
//  CameraViewController.swift
//  Zebo
//
//  Created by Nigorakhon Mamadalieva on 11/06/25.
//


import UIKit
import AVFoundation
import Vision
import CoreImage

class CameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    private let session = AVCaptureSession()
    private var previewLayer: AVCaptureVideoPreviewLayer!

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

        let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .leftMirrored)
        try? imageRequestHandler.perform([request])
    }
    
    func processFaceObservation(_ face: VNFaceObservation, in pixelBuffer: CVPixelBuffer) {
        let ciImage = CIImage(cvPixelBuffer: pixelBuffer)

        // Convert bounding box (normalized) to pixel coordinates
        let width = CGFloat(CVPixelBufferGetWidth(pixelBuffer))
        let height = CGFloat(CVPixelBufferGetHeight(pixelBuffer))

        let faceRect = CGRect(
            x: face.boundingBox.origin.x * width,
            y: (1 - face.boundingBox.origin.y - face.boundingBox.size.height) * height,
            width: face.boundingBox.size.width * width,
            height: face.boundingBox.size.height * height
        )

        let cropped = ciImage.cropped(to: faceRect)
        analyzeSkinColor(in: cropped)
    }
    
    func analyzeSkinColor(in image: CIImage) {
        let context = CIContext()
        guard let cgImage = context.createCGImage(image, from: image.extent) else { return }

        let uiImage = UIImage(cgImage: cgImage)
        guard let averageColor = uiImage.averageColor else { return }

        DispatchQueue.main.async {
            print("🎨 Skin color: \(averageColor)")
            // Next: classify this color into a season
        }
    }

}
