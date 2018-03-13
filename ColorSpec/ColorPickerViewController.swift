//
//  ColorPickerViewController.swift
//  ColorSpec
//
//  Created by Kevin Randrup on 3/12/18.
//  Copyright © 2018 Kevin Randrup. All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController {
    
    func initialize(startingColor: UIColor = .white, callback: @escaping (UIColor) -> ()) {
        self.startColor = startingColor
        self.callback = callback
    }

    //MARK: - Properties

    var callback: ((UIColor) -> ())?

    private var startColor: UIColor = .white
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var currentColor: UIColor {
        let red = CGFloat(redSlider.value) / 256
        let green = CGFloat(greenSlider.value) / 256
        let blue = CGFloat(blueSlider.value) / 256
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    override func viewDidLoad() {
        self.colorView.backgroundColor = self.startColor
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        startColor.getRed(&red, green: &green, blue: &blue, alpha: nil)
        redSlider.value = 256 * Float(red)
        greenSlider.value = 256 * Float(green)
        blueSlider.value = 256 * Float(blue)
    }
    
    
    //MARK: - User Interaction
    
    @IBAction func updateColor() {
        self.colorView.backgroundColor = self.currentColor
    }
    
    @IBAction func donePressed(_ sender: Any) {
        self.callback?(self.currentColor)
        self.navigationController?.popViewController(animated: true)
    }
}


