//var goldBars = 0
//func unlockTreasureChest(inventory: Int) -> Int {
//  inventory + 100
//}
//goldBars = unlockTreasureChest(inventory: goldBars)
//print(goldBars)
//goldBars = unlockTreasureChest(inventory: goldBars)
//print(goldBars)
//goldBars = unlockTreasureChest(inventory: goldBars)
//print(goldBars)
var goldBars = 0
func incrementInventory(_ inventory: inout Int, by amount: Int = 100) {
  inventory += amount
}
incrementInventory(&goldBars)
print(goldBars)
incrementInventory(&goldBars)
print(goldBars)
incrementInventory(&goldBars)
print(goldBars)
incrementInventory(&goldBars, by: 300)
print(goldBars)
incrementInventory(&goldBars, by: 50)
print(goldBars)
