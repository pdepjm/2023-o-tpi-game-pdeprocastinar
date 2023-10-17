import wollok.game.*
import susana.*
import personajes.*
import configuraciones.*
import elementos.*

object vecindad {
	method generar() {
        game.ground("pastito.png")
        game.addVisual(casaMessi)
        game.addVisual(casaMoria)
    }

    method interactuar() {
        nivel.cargarMapa(self)
	}
}

class Casa {
    method position() = game.at(0,0)
    method image() = ""
    method propietario() = susana
    method piso() = "madera.png"
    method elemento() = copa

    method generar() {
        game.ground(self.piso())
        game.addVisual(self.propietario())
        self.evaluarCondiciones(self.elemento())
    }

    method interactuar() {
        nivel.cargarMapa(self)
    }

    method evaluarCondiciones(elemento) {
        if (!susana.tiene(elemento) && !susana.tuvo(elemento)) game.addVisual(elemento)
        game.addVisualIn(puerta, game.at(10,5))
    }
}

object casaMessi inherits Casa {
    override method position() = game.at(4,4)
    override method image() = "house2.png"
    override method propietario() = messi
    override method elemento() = botines
    
}

object casaMoria inherits Casa {
    override method position() = game.at(12,8)
    override method image() = "house3.png"
    override method propietario() = moria
    override method elemento() = martinFierro

    override method interactuar() {
        if(susana.tuvo(botines)) {
        	nivel.cargarMapa(self)
        } else {
        	game.say(susana, "Primero debo hablar con Messi")
        }
    }
}