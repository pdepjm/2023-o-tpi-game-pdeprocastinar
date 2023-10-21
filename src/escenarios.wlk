import wollok.game.*
import susana.*
import personajes.*
import configuraciones.*
import elementos.*
import zona.*

object vecindad {
//	method zonas () = [new Zona(xIni = 0, xFin = 5, yIni = 0, yFin = 5), new Zona(xIni = 4, xFin = 10, yIni = 6, yFin = 7), new Zona(xIni = 10, xFin = 12, yIni = 3, yFin = 5)]
	method zonas () = [new Zona(xIni = 0, xFin = 29, yIni = 0, yFin = 19)]
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
	method zonas () = [new Zona(xIni = 0, xFin = 29, yIni = 0, yFin = 19)]
    var position = game.at(0,0)
    var image = ""
    var propietario = susana
    var piso = "madera.png"
    var elemento = copa
    var interaccion = entrarALaCasa

    method generar() {
        game.addVisual(self.propietario())
        self.evaluarCondiciones(self.elemento())
    }

    /* method interactuar() {
        nivel.cargarMapa(self)
    } */

    method evaluarCondiciones(elemento) {
        if (!susana.tiene(elemento) && !susana.tuvo(elemento)) game.addVisual(elemento)
        game.addVisualIn(puerta, game.at(10,5))
    }

    const casaMessi(position = game.at(4,4), image = "house2.png", propietario = messi, elemento = botines)
    const casaMoria(position = game.at(12,8), image = "house3.png", propietario = moria, elemento = martinFierro, interactuar = accederCasaMoria)

}

object entrarALaCasa {
    method interactuar(casa) {
        nivel.cargarMapa(self)
    }
}

object accederCasaMoria {
    method interactuar() {
        if(susana.tuvo(botines)) {
            nivel.cargarMapa(self)
        } else {
            game.say(susana, "Primero debo hablar con Messi")
        }
    }
}
