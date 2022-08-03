//
//  ViewController.swift
//  ContadorDias
//
//  Created by Selena Belén Garcia Lobo on 01/08/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cumpleTextField: UITextField!

    @IBOutlet weak var resultadoLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func calcularDias(fecha: String?) {
        guard let fecha = fecha else {
            return
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let cumpleDate = dateFormatter.date(from: fecha)

        guard let cumpleDate = cumpleDate else {
            return
        }

        let calendar = Calendar.current

        let firstDate = Date()

        let date1 = calendar.startOfDay(for: firstDate)
        let date2 = calendar.startOfDay(for: cumpleDate)
        let components = calendar.dateComponents([.day], from: date1, to: date2)

        resultadoLabel.text = String(abs(components.day ?? 0))
    }

    @IBAction func calcularButton(_ sender: UIButton) {
        let cumpleString = cumpleTextField.text
        calcularDias(fecha: cumpleString)

    }

}

