//
//  WinnerViewController.swift
//  Final Project
//
//  Created by Sarah covey on 12/2/19.
//  Copyright © 2019 Sarah covey. All rights reserved.
//

import UIKit

class WinnerViewController: UIViewController {
    var winner: String?;

    @IBOutlet var winningPlayerLabel: UILabel!
    
    @IBOutlet weak var winnerImageView: UIImageView!
    @IBOutlet var winnerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        winnerImageView.isUserInteractionEnabled = true;
        winnerImageView.addGestureRecognizer(tapGestureRecognizer);
        
    if let winner = Winner.loadFromFile(){
        winningPlayerLabel.text = "Player \(winner.winner)";
        } else { winningPlayerLabel.text = "Not working."}
    }
    
    override func awakeFromNib() {
        self.createParticles();
        self.animate();
    }
    
    func animate(){
        UIView.animate(withDuration: 0.8) {
            self.winnerImageView.transform = CGAffineTransform(scaleX: 0.4, y: 0.3)
        }
        UIView.animate(withDuration: 1) {
            self.winnerImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
        UIView.animate(withDuration: 0.5) {
            self.winnerImageView.transform = CGAffineTransform.identity
        }
    }
    
    @IBAction func playAgainButtonTapped(_ sender: Any) {
    }
    
    func createParticles() {
        let particleEmitter = CAEmitterLayer()

        particleEmitter.emitterPosition = CGPoint(x: view.center.x, y: -96);
        particleEmitter.emitterShape = .line;
//        particleEmitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)
        particleEmitter.emitterSize = CGSize(width: 1, height: 1);
        particleEmitter.beginTime = CACurrentMediaTime();
        
        let red = makeEmitterCell(color: #colorLiteral(red: 0.9764705896, green: 0.29685607, blue: 0.4217901272, alpha: 0.3103328339));
        let green = makeEmitterCell(color: #colorLiteral(red: 0.6719222821, green: 1, blue: 0.5544397083, alpha: 0.3103328339));
        let blue = makeEmitterCell(color: #colorLiteral(red: 0.1822003166, green: 0.9407721207, blue: 1, alpha: 0.3103328339));

        particleEmitter.emitterCells = [red, green, blue];
        
        winnerView.layer.insertSublayer(particleEmitter, above: winnerImageView.layer);
    }

    func makeEmitterCell(color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell();
        cell.birthRate = 3.2;
        cell.lifetime = 7.0;
        cell.lifetimeRange = 0;
        cell.color = color.cgColor;
        cell.velocity = 200;
        cell.velocityRange = 50;
        cell.emissionLongitude = CGFloat.pi;
        cell.emissionRange = CGFloat.pi / 4;
        cell.spin = 2;
        cell.spinRange = 3;
        cell.scaleRange = 2;
        cell.scaleSpeed = -0.05;

        cell.contents = UIImage(named: "circle-image")?.cgImage;
        return cell;
    }
    
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.animate();
    }
    
    @IBAction func homeButtonTapped(_ sender: Any) {

            guard let vc = self.presentingViewController else { return }

            while (vc.presentingViewController != nil) {
                vc.dismiss(animated: true, completion: nil);
            
        }
    }
    
}
