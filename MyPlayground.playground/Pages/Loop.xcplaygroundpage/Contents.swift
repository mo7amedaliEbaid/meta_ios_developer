let numberPlate = "WW87GP"
for character in numberPlate {
  print("character is = \(character)")
}
for dice in 1...6 {
    print("Roll a \(dice).")
}
//var firstDice = Int.random(in: 1...6)
//var secondDice = Int.random(in: 1...6)
//while firstDice != secondDice {
//  firstDice = Int.random(in: 1...6)
//  secondDice = Int.random(in: 1...6)
//}
//print("You rolled a double \(firstDice).")
var firstDice = 0
var secondDice = 0
repeat {
  firstDice = Int.random(in: 1...6)
  secondDice = Int.random(in: 1...6)
} while firstDice != secondDice
print("You rolled a double \(firstDice).")
let levels = 10
let freeLevels = 4
let bonusLevel = 3
for level in 1...levels {
  if level == bonusLevel {
    print("Skip bonus level \(bonusLevel).")
    continue
  }
  print("Play level \(level).")
  if level == freeLevels {
    print("You have played all \(freeLevels) free levels. Buy the game to play the remaining \(levels - freeLevels) levels.")
    break
  }
}
