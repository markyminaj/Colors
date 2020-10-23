//
//  ColorsTableVC.swift
//  Colors
//
//  Created by Mark Martin on 8/25/20.
//  Copyright © 2020 Mark Martin. All rights reserved.
//

import UIKit

class ColorsTableVC: UIViewController {
    
    var colors: [UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createRandomColors()
        // Do any additional setup after loading the view.
        print("Hello")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as? ColorsDetailVC
        destVC?.color = sender as? UIColor
    }
    
    func createRandomColors() {
        for _ in 0..<50 {
            colors.append(generateColor())
        }
    }
    
    func generateColor() -> UIColor {
        let randomColor = UIColor.init(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        return randomColor
    }
}

extension ColorsTableVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") else {
            return UITableViewCell()
        }
        cell.backgroundColor = colors[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: "ToColorsDetailsVC", sender: color)
    }
}
