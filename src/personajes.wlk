import wollok.game.*
import susana.*
import elementos.*

object messi {
	var property position = game.at(5,8)

	method image() = "messi.png"
	
	method interactuar() {
		if(susana.tuvo(botines)) {
			game.say(self, "Conseguime el balón de oro, creo que lo tiene Moria")
			
		} else if (susana.tiene(botines)) {
			susana.entregar(botines)
			game.say(self, "Conseguime el balón de oro, creo que lo tiene Moria")
			
		} else if (susana.tiene(balonDeOro)) {
			susana.entregar(balonDeOro)
			game.say(self, "Gracias Su! Tomá la copa :D")
			susana.agregarA(susana.inventario(), copa)
			
		} else {
			game.say(self, "Hola Su! Tengo que pedirte un favor, pero primero buscame mis botines")
		}
	}

}