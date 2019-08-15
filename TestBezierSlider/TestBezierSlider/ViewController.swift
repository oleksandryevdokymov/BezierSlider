//
//  ViewController.swift
//  TestBezierSlider
//
//  Created by Oleksandr Yevdokymov on 8/13/19.
//  Copyright © 2019 OleksandrYevdokymov. All rights reserved.
//

import UIKit
import BezierSlider

class ViewController: UIViewController {
    
    @IBOutlet private weak var sunIcon: UIImageView!
    
    private var bezierSlider = BezierSlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bezierSlider = BezierSlider(curvedPath: curvedCirlePath(), frame:CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height - 240))
        bezierSlider.delegate = self
        view.addSubview(bezierSlider)
    }
    
    @IBAction func segmentedControlTapped(_ sender: UISegmentedControl) {
        bezierSlider.removeFromSuperview()
        if sender.selectedSegmentIndex == 0 {
            bezierSlider = BezierSlider(curvedPath: curvedCirlePath(), frame:CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height - 240))
            bezierSlider.delegate = self
            view.addSubview(bezierSlider)
        } else {
            bezierSlider = BezierSlider(curvedPath: createCurvePath(), frame:CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height - 240))
            bezierSlider.thumbFillColor = .clear
            bezierSlider.thumbStrokeColor = .red
            bezierSlider.thumbLineWidth = 4.0
            bezierSlider.curvedStrokeColor = .orange
            bezierSlider.delegate = self
            view.addSubview(bezierSlider)
        }
    }
    
    func createCurvePath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 30, y: 200))
        path.addQuadCurve(to: CGPoint(x: 320, y: 200), controlPoint: CGPoint(x: 160, y: 10))
        return path
    }
    
    func curvedCirlePath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 60, y: 80))
        path.addCurve(to: CGPoint(x: 80, y: 460), // ending point
            controlPoint1: CGPoint(x: 40, y: 160),
            controlPoint2: CGPoint(x: 160, y: 320))
        return path
    }
}

// MARK: - Receive slider's value when thumb position changed
extension ViewController: BezierSliderDelegate {
    func sliderPositionChanged(value: Float) {
        sunIcon.alpha = CGFloat(value)
        sunIcon.transform = CGAffineTransform(rotationAngle: CGFloat(value))
    }
}


