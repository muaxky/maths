// monthyh.swift

// 05.09.2026

var doors: [String] = ["empty","empty","empty"]
var gameEnd: Bool = false
var gamesWonSwitched: Int = 0
var gamesWonNotSwitched: Int = 0
var playGameCount: Int = 100

func showDoors() {
	for i in 0...2 {
		print("Door \(i+1): "+doors[i])
	}
}

func randomizeDoors() {
	doors = ["goat","goat","goat"];
	let winningDoor = Int.random(in: 0...2)
	doors[winningDoor] = "car"
}

func resetGame() {
	randomizeDoors()
	gameEnd = false
}

func playGame(_ switchSecondDoor: Bool)->Int {
	resetGame()
	print("\n--- A new game round started! ---")
	showDoors()
	// player selects one of the three doors
	var doorSelectPlayer = Int.random(in: 0...2)
	// host reveals a goat behind one of the other two doors
	var hostSelectedDoor: Bool = false
	var doorSelectHost = 0
	while (hostSelectedDoor == false ) {
		doorSelectHost = Int.random(in: 0...2)
		if ((doors[doorSelectHost] == "goat") && (doorSelectHost != doorSelectPlayer)) {
			hostSelectedDoor = true
		}
	}
	// player chooses if he wants to switch to the other remaining door
	if (switchSecondDoor) {
		// the player switches to the other remaining door
		for i in 0...2 {
			if ((i != doorSelectPlayer) && (i != doorSelectHost)) {
				doorSelectPlayer = i
				print("Player switches to Door \(i+1)")
				break
			}
		}
	}
	// checking if the player has won (picked door with car behind)
	if (doors[doorSelectPlayer] == "car") { 
		print("Player won the game!")
		return 1
	} else {
		print("Player lost the game!")
		return 0
	}
}

// playing n (playGameCount) games without switching
for _ in 1...playGameCount {
	if (playGame(false) == 1) { gamesWonNotSwitched += 1 }
}

// playing n (playGameCount) games with switching
for _ in 1...playGameCount {
	if (playGame(true) == 1) { gamesWonSwitched += 1 }
}

print("\n--- Results ---")
print("Games won w/ switching door: \(gamesWonSwitched)")
print("Games won w/o switching door: \(gamesWonNotSwitched)")