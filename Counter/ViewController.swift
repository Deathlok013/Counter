//
//  ViewController.swift
//  Counter
//
//  Created by Macbook on 03.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var counter: Int = 0 {
        didSet {
            /// При каждом обновлении значения переменной - обновляем текст в лэйбле
            updateCounterLabel()
        }
    }
    private func updateCounterLabel() {
        counterLabel.text = "Значение счетчика: \(counter)"
    }
    @IBOutlet weak private var scrollView: UIScrollView!
    @IBOutlet weak private var historyView: UITextView!
    @IBOutlet weak private var restartButton: UIButton!
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var plusButton: UIButton!
    @IBOutlet weak private var minusButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyView.isEditable = false
        historyView.addSubview(scrollView)
        scrollView.contentSize = historyView.bounds.size
        // Включение прокрутки по контенту
        historyView.isScrollEnabled = true
        scrollView.isScrollEnabled = true
        // Включение прокрутки scrollView
        scrollView.alwaysBounceVertical = true
        historyView.text = "История изменений:\n"
    }
    
    @IBAction private func plusTapped(_ sender: Any) {
        counter += 1
        // Обновляем историю
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateString = formatter.string(from: Date())
        historyView.text += "\(dateString): значение изменено на +1\n"
        
        updateCounterLabel()
    }
    @IBAction private func minusTapped(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            // Обновляем историю
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let dateString = formatter.string(from: Date())
            historyView.text += "\(dateString): значение изменено на -1\n"
        } else {
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let dateString = formatter.string(from: Date())
            historyView.text += "\(dateString): попытка уменьшить значение счетчика ниже 0\n"
            
            return
        }
        updateCounterLabel()
    }
    
    @IBAction private func resetGame(_ sender: Any) {
        counter = 0
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateString = formatter.string(from: Date())
        historyView.text += "\(dateString): значение сброшено\n"
    }
}

