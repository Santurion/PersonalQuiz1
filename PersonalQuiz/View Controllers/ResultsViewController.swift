//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 26.10.2020.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var resultsNavigationItem: UINavigationItem!
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var characteristicLabel: UILabel!
    
    var answersChoosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItem()
        setupLabels()
    }
    
    private func setupNavigationItem() {
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = nil
    }
    
    private func setupLabels() {
        if let animalType = frequentAnimalTypeInAnswers() {
            animalLabel.text = "Вы - \(animalType.rawValue)!"
            characteristicLabel.text = animalType.definition
        }
    }
    
    private func frequentAnimalTypeInAnswers() -> AnimalType? {
        var countAnimalTypes: [AnimalType: Int] = [:]
        for answer in answersChoosen {
            let answerType = answer.type
            countAnimalTypes[answerType] = (countAnimalTypes[answerType] ?? 0) + 1
        }
        
        return countAnimalTypes.max { $0.value < $1.value }?.key
    }
}
