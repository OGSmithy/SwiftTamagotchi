//
//  main.swift
//  Tamagotchiv2
//
//  Created by Smith, Oli (AMM) on 23/11/2023.
//

import Foundation

import SwiftUI

class Tamagotchi {
    private var deceased: Bool = false
    private var height: Int = 10
    private let displayWidthPixels: Int = 16
    private let displayHeightPixels: Int = 16
    private let lifespan = 30
    private var health: Int = 10
    private var discipline: Int = 10
    private var isIll: Bool = false
    private var hunger: Int = 10
    private var happiness: Int = 10
    
    
    func getDeceased() -> Bool {
        return self.deceased
    }
    func setDeceasced(newDeceasedStatus: Bool) {
        deceased = newDeceasedStatus
    }
    
    
    func getHeight() -> Int {
        return self.height
    }
    func setHeight(newHeightStatus: Int) {
        height = newHeightStatus
    }
    

    func getHunger() -> Int {
        return self.hunger
    }
    func setHunger(newHungerStatus: Int) {
        hunger = newHungerStatus
    }
    
    
    func getIsIll() -> Bool {
        return self.isIll
    }
    func setIsIll(newIsIllStatus: Bool) {
        isIll = newIsIllStatus
    }
    
    
    func getHealth() -> Int {
        return self.health
    }
    func setHealth(newHealthStatus: Int) {
        health = newHealthStatus
    }
    
    
    func getDiscipline() -> Int {
        return self.discipline
    }
    func setDiscipline(newDisciplineStatus: Int) {
        discipline = newDisciplineStatus
    }
    
    
    func getHappniess() -> Int {
        return self.happiness
    }
    func setHappniess(newHappniessStatus: Int) {
        happiness = newHappniessStatus
    }
    
    
}


var tamagotchiStats = Tamagotchi()
var currentlyDead = tamagotchiStats.getDeceased()

while currentlyDead == false {

    var currentHealth = tamagotchiStats.getHealth()
    var currentHeight = tamagotchiStats.getHeight()
    var currentIsIll = tamagotchiStats.getIsIll()
    var currentDiscipline = tamagotchiStats.getDiscipline()
    var currentHunger = tamagotchiStats.getHunger()
    var currentHappiness = tamagotchiStats.getHappniess()
    
    
    print("""
    Your Tamagotchi stats are:
    Health: \(currentHealth)
    Happiness: \(currentHappiness)
    Height: \(currentHeight)
    Illness: \(currentIsIll)
    Hunger: \(currentHunger)
    Discipline level: \(currentDiscipline)

    What would you like to do?
    Type '1': Feed
    Type '2': Play
    Type '3': Give Discipline
    Type '4': Give Medicine
    Type '5': Neglect
"""
    )
    
    if let action = readLine() {
        switch action {
        case "1":
            if currentHunger != 0 {
                currentHunger -= 1
            }
        case "2":
            if currentHappiness != 10 {
                currentHappiness += 1
            }
        case "3":
            if currentDiscipline != 10 {
                currentDiscipline += 1
            }
        case "4":
            if currentIsIll == true {
                currentIsIll = false
            }
        default:
            if currentHealth > 0 {
                currentHealth -= 1
                tamagotchiStats.setHealth(newHealthStatus: currentHealth)
            }
        }
    }
    if currentHealth == 0 {
        tamagotchiStats.setDeceasced(newDeceasedStatus: true)
    }
    else {
        if currentHunger == 10 {
            currentHealth -= 1
        }
        if currentDiscipline == 0 {
            currentHealth -= 1
        }
        if currentIsIll == true {
            currentHealth -= 1
        }
        if currentHappiness == 0 {
            currentHealth -= 1
            print("Be carefull, your Tamagotchi is suicidal")
        }
    }
    var currentlyDead = tamagotchiStats.getDeceased()
}

print("You are being investigated for neglect and murder due to the untimely death of your tamagotchi")
