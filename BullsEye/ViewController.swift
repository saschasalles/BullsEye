//
//  ViewController.swift
//  BullsEye
//
//  Created by Sascha Sallès on 22/03/2021.
//

import UIKit

class ViewController: UIViewController {
  var targetValue: Int = 0
  var currentValue: Int = 0
  var score: Int = 0
  var round: Int = 0

  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  @IBOutlet weak var startOverButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    self.startOver()
  }

  @IBAction func showAlert() {
    let difference = abs(targetValue - currentValue)
    var points = 100 - difference


    var title: String
    if difference == 0 {
      title = "Perfect!"
      points += 100
    } else if difference < 5 {
      title = "You almost had it!"
      if difference == 1 {
        points += 50
      }
    } else if difference < 10 {
      title = "Pretty good!"
    } else {
      title = "Not even close..."
    }

    score += points

    let message = "You scored \(points) points"

    let alert = UIAlertController(
      title: title,
      message: message,
      preferredStyle: .alert)

    let action = UIAlertAction(
      title: "Ok",
      style: .default) { _ in
      self.startNewRound()
    }

    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }


  @IBAction func sliderMoved(_ slider: UISlider) {
    self.currentValue = lroundf(slider.value)
  }

  @IBAction func startOver() {
    self.round = 0
    self.score = 0
    self.startNewRound()
  }



  func startNewRound() {
    self.targetValue = Int.random(in: 1...100)
    self.currentValue = 50
    self.slider.value = Float(currentValue)
    self.round += 1
    self.updateLabels()
  }

  func updateLabels() {
    scoreLabel.text = String(score)
    targetLabel.text = String(targetValue)
    roundLabel.text = String(round)
  }

}

