import wollok.game.*
import susana.*

object messi {
	var property position = game.at(5,8)

	method image() = "messi.png"
	
	method interactuar() {
		if(susana.checkpoint() == 0) {
			game.say(self, "Hola Su! Tengo que pedirte un favor, pero primero buscame mis botines")
			
		} else if (susana.checkpoint() == 1) {
			game.say(self, "Conseguime el balón de oro, creo que lo tiene Moria")
			
		} else if (susana.checkpoint() == 20) {
			game.say(self, "Gracias Su! Tomá la copa :D")
			
		} else {
			game.say(self, "No vuelvas hasta que traigas mi balón")
		}
	}

}