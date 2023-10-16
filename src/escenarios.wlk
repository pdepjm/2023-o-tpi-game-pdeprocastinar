import wollok.game.*
import susana.*
import personajes.*
import configuraciones.*
import elementos.*

object vecindad {
	method generar() {
        game.ground("pastito.png")
        game.addVisual(casaMessi)
    }

    method interactuar() {
        nivel.cargarMapa(self)
	}
}

class Casa {
    
}

object casaMessi {
    var property position = game.at(4,4)

    method image() = "house2.png"
    
    method generar() {
        game.ground("madera.png")
        game.addVisual(messi)
        if (!susana.tiene(botines) && !susana.tuvo(botines)) game.addVisual(botines)
        game.addVisualIn(puerta, game.at(10,5))
    }

    method interactuar() {
        nivel.cargarMapa(self)
    }

} 

object casaMoria {
    var property position = game.at(12,8)
    
    method generar() {
        game.ground("madera.png")
        game.addVisual(messi)
    }
    
	method interactuar() {
        nivel.cargarMapa(self)
    }
}