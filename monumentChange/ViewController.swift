//
//  ViewController.swift
//  monumentChange
//
//  Created by user164187 on 1/31/20.
//  Copyright © 2020 Salvador gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct Monument {
        
        let name: String
        let image: UIImageView
        var switchValue: Bool
        var sliderValue: Float
        let description: String
        
    }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var oldMonumentImage: UIImageView!
    @IBOutlet weak var newMonumentImage: UIImageView!
    @IBOutlet weak var mainSwitch: UISwitch!
    @IBOutlet weak var mainSlider: UISlider!
    @IBOutlet weak var infoLabel: UILabel!
    
    lazy var ghizaPyramid = Monument(name: "Piramide de ghiza", image: oldMonumentImage, switchValue: false, sliderValue: 0, description: "La Gran Pirámide de Guiza (también conocida como pirámide de Keops o de Jufu) es la más antigua de las siete maravillas del mundo y la única que aún perdura, además de ser la mayor de las pirámides de Egipto. Fue ordenada construir por el faraón Keops de la cuarta dinastía del Antiguo Egipto. El arquitecto de dicha obra es Hemiunu")
    
    lazy var tajMahal = Monument(name: "Taj Mahal", image: newMonumentImage, switchValue: true, sliderValue: 1, description: "El Taj Mahal (hindi: ताज महल Tāj Mahal, urdu: تاج محل Tāŷ Mahal 'Corona de los palacios'; /tɑːʒ mə'hɑl/)1​2​ es un monumento funerario construido entre 1631 y 1654 en la ciudad de Agra, estado de Uttar Pradesh (India), a orillas del río Yamuna, por el emperador musulmán Shah Jahan de la dinastía mogol")
    
    func updateUI (
        displayedMonument: Monument,
        unDisplayedMonument: Monument
    ) {
        
        titleLabel.text = displayedMonument.name
        mainSwitch.isOn = displayedMonument.switchValue
        mainSlider.value = displayedMonument.sliderValue
        infoLabel.text = displayedMonument.description
        displayedMonument.image.alpha = 1
        unDisplayedMonument.image.alpha = 0
        
    }
    
    @IBAction func changeUISwitch() {
        
        if mainSwitch.isOn {
            updateUI(
                displayedMonument: tajMahal,
                unDisplayedMonument: ghizaPyramid
            )
            return
        }
        
        updateUI(
            displayedMonument: ghizaPyramid,
            unDisplayedMonument: tajMahal
        )
        
    }
    
    @IBAction func changeUISlider() {
        
        tajMahal.image.alpha = CGFloat(mainSlider.value)
        ghizaPyramid.image.alpha = 1 - CGFloat(mainSlider.value)
        
        if mainSlider.value == 1 {
            updateUI(
                displayedMonument: tajMahal,
                unDisplayedMonument: ghizaPyramid
            )
        }
        
        if mainSlider.value == 0 {
            updateUI(
                displayedMonument: ghizaPyramid,
                unDisplayedMonument: tajMahal
            )
        }        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        updateUI(
            displayedMonument: tajMahal,
            unDisplayedMonument: ghizaPyramid
        )
        
    }
    
}
