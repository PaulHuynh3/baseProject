//
//  CameraViewController.swift
//  Paul Huynh
//
//  Created by Paul Huynh on 2020-10-09.
//  Copyright © 2020 Paul Huynh. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {

    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var takePhotoButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var retryButton: UIButton!

    var viewModel = CameraViewModel()
    var captureSession: AVCaptureSession?
    var captureDevice: AVCaptureDevice?

    // MARK - View Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }

    override func viewWillDisappear(_ animated: Bool) {
        stopCaptureSession()
    }

    // MARK - Configuration

    func setup() {
        hideSubmitRetryButton()
        prepareSession()
        setupObserver()
    }

    func configure(type: iDType) {//construct Data in here
        //        viewModel = PhotoInformationViewController.viewModel(type: type)
    }

    enum iDType: String {
        case driverLicenseViewModel
        case carDetailsViewModel
    }

    func setupObserver() {
        viewModel.photoBindable.bind(self) { [weak self] isTakePhotoTapped in
            if isTakePhotoTapped == true {
                print("PHOTO TAKEN PERFORM ACTIONS")
                self?.photoTaken()
            }
        }
    }

    // MARK: - IBActions

    @IBAction func takePhotoTapped(_ sender: Any) {
        viewModel.photoBindable.value = true
    }

    @IBAction func submitButtonTapped(_ sender: Any) {
       handlePhotoSubmission()
    }

    @IBAction func retryButtonTapped(_ sender: Any) {
        resetSession()
    }

    // MARK - Camera Process

    func prepareSession() {
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSession.Preset.photo

        //try built in dual wide camera after too and other types of camera.
        if let availableDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back).devices.first {
            captureDevice = availableDevices
            configurePreviewLayerCaptureSession()
        }
    }

    func configurePreviewLayerCaptureSession() {
        guard let captureSession = captureSession else { fatalError("Capture Session not properly set up")}
        if let inputs = captureSession.inputs as? [AVCaptureDeviceInput] {
            for input in inputs {
                captureSession.removeInput(input)
            }
        }
        guard let captureDevice = captureDevice else {
            print("Capture Device is nil")
            return
        }
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(captureDeviceInput)
        } catch {
            print(error.localizedDescription)
        }

        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.frame
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        previewLayer.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        previewView.layer.addSublayer(previewLayer)
        captureSession.startRunning()

        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as String) : NSNumber(value: kCVPixelFormatType_32BGRA)]
        dataOutput.alwaysDiscardsLateVideoFrames = true

        if captureSession.canAddOutput(dataOutput) {
            captureSession.addOutput(dataOutput)
        }
        captureSession.commitConfiguration()

        let queue = DispatchQueue(label: "com.Paul Huynh.captureQueue")
        dataOutput.setSampleBufferDelegate(self, queue: queue)
    }

    func stopCaptureSession() {
        captureSession?.stopRunning()
        if let inputs = captureSession?.inputs as? [AVCaptureDeviceInput] {
            for input in inputs {
                captureSession?.removeInput(input)
            }
        }
    }

    func photoTaken() {
        DispatchQueue.main.async {
            self.submitButton.isHidden = false
            self.retryButton.isHidden = false
        }
        stopCaptureSession()
    }

    func resetSession() {
        hideSubmitRetryButton()
        viewModel.image = nil
        prepareSession()
    }

    func hideSubmitRetryButton() {
        DispatchQueue.main.async {
            self.submitButton.isHidden = true
            self.retryButton.isHidden = true
        }
    }

    private func handlePhotoSubmission() {
        //            if let image = viewModel?.image {
        //maybe instead of popping up a new vc i can just populate the image on the same VC
        //let imageButton = image
        //                DispatchQueue.main.async {
        //send it to the other vc
        // let photoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier "") as? PhotoViewController!
        //photoVC.takenPhoto = image

        // present(photoVC) in the completion call self.stopCaptureSession()

        //                }
        //            }
        navigationController?.popToRootViewController(animated: true)
    }
}

extension CameraViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func getImagefromSampleBuffer(buffer: CMSampleBuffer) -> UIImage? {
        if let pixelBuffer = CMSampleBufferGetImageBuffer(buffer) {
            let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
            let context = CIContext()

            let imageRect = CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(pixelBuffer), height: CVPixelBufferGetHeight(pixelBuffer))

            if let image = context.createCGImage(ciImage, from: imageRect) {
                return UIImage(cgImage: image, scale: UIScreen.main.scale, orientation: .right)
            }
        }
        return nil
    }

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        if viewModel.photoBindable.value == true {
            viewModel.image = getImagefromSampleBuffer(buffer: sampleBuffer)
        }
    }
}
