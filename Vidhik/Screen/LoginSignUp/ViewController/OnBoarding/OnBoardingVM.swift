//
//  OnBoardingVM.swift
//  Vidhik
//
//  Created by NumeroEins on 01/05/24.
//

import Foundation

class OnBoardingVM {
    
    var onBoardingData: [OnBoardingModel]?
    
    func setDataForOnBoardingScreen() {
        onBoardingData = [OnBoardingModel(image: "OnboardingImage 1", title: "Get Legal Expertise at Your Fingertips", description: "Welcome to Vidhik, your go-to destination for legal assistance. Whether you need advice, representation, or legal information, our platform connects you with experienced lawyers ready to help."),
                      OnBoardingModel(image: "OnboardingImage 2", title: "Tailored Legal Solutions", description: "Tell us about your legal needs, and we'll match you with qualified lawyers specializing in your area of concern. Browse profiles, read reviews, and choose the legal expert who fits your requirements. Vidhik is here to make finding the right attorney simple and efficient."),
                      OnBoardingModel(image: "OnboardingImage 3", title: "Connect Instantly, Anytime, Anywhere", description: "Communicate with your lawyer effortlessly through our secure messaging system. Receive updates, share documents, and get the legal support you need, all from the convenience of your mobile device. Vidhik ensures that legal assistance is just a message away.")]
    }
}
