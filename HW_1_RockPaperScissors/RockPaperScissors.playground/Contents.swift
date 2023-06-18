import Cocoa

enum GameTools: Int {
  case Rock
  case Paper
  case Scissors
}

func whoWins(_ pc: GameTools, _ my: GameTools) {
  if pc == my {
    print("Berabere")
  } else if (my == .Paper && pc == .Rock) || (my == .Rock && pc == .Scissors) || (my == .Scissors && pc == .Paper) {
    print("Kazandınız")
  } else {
    print("Kaybettiniz")
  }
}

var pcChoice = GameTools(rawValue: Int.random(in: 0...2))
print("Bilgisayarın seçimi:\(pcChoice!)")

var myChoice: GameTools = .Paper
print("Sizin seçiminiz:\(myChoice)")

whoWins(pcChoice!, myChoice)
