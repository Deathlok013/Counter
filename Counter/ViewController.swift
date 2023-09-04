//
//  ViewController.swift
//  Counter
//
//  Created by Macbook on 03.09.2023.
//

import UIKit

class ViewController: UIViewController {
    var shouldReset: Bool = false {
        didSet {
            /// При каждом обновлении значения переменной - обновляем текст в лэйбле
            updateCounterLabel()
        }
    }
    var counter: Int = 0 {
        didSet {
            /// При каждом обновлении значения переменной - обновляем текст в лэйбле
            updateCounterLabel()
        }
    }
    
    @IBOutlet var ScrollView: UIScrollView!
    @IBOutlet var historyView: UITextView!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
//
//                // Установка scrollView в качестве представления контроллера
//                view = ScrollView
//
//
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyView.addSubview(ScrollView)
        ScrollView.contentSize = historyView.bounds.size
//         Включение прокрутки по контенту
                        historyView.isScrollEnabled = true
        ScrollView.isScrollEnabled = true
                        // Включение прокрутки scrollView
                        ScrollView.alwaysBounceVertical = true
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        counter += 1
        // Обновляем историю
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateString = formatter.string(from: Date())
        history += "\(dateString): значение изменено на +1\n"
        
        // Отображаем историю в UITextView
        historyView.text = history
        updateCounterLabel()
    }
    @IBAction func minusTapped(_ sender: Any) {
        if counter > 0 {
            counter -= 1
        }
        if counter < 0 {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let dateString = formatter.string(from: Date())
            history += "\(dateString): попытка уменьшить значение счетчика ниже 0\n"
            
            // Отображаем историю в UITextView
            historyView.text = history
            return
        }
        
        // Обновляем историю
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateString = formatter.string(from: Date())
        history += "\(dateString): значение изменено на -1\n"
        
        // Отображаем историю в UITextView
        historyView.text = history
        updateCounterLabel()
    }
    @IBAction func resetGame(_ sender: Any) {
        shouldReset = true
        if shouldReset == true {
            counter = 0
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let dateString = formatter.string(from: Date())
            history += "\(dateString): значение сброшено\n"
            
            // Отображаем историю в UITextView
            historyView.text = history
        }
    }
    func updateCounterLabel() {
        counterLabel.text = "Значение счетчика: \(counter)"
    }
    var history = "История изменений:\n"
    }

