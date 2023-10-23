import wollok.game.*
import susana.*
import configuraciones.*
import personajes.*
import elementos.*

class CasaNoJugable {
	var property position = game.at(0,0)
    var image = "vecindad/"
    var propietario = null
    
    var dialogos = {}
    
    var property casaEscudero = new CasaNoJugable(position = game.at(15,17), image = image + "casa-escudero.png")
	var property casaFort = new CasaNoJugable(position = game.at(25,3), image = image + "casa-fort.png")
	var property casaPimpinela = new CasaNoJugable(position = game.at(5,11), image = image + "casa-pimpinela.png")
	var property casaTaylor = new CasaNoJugable(position = game.at(8,2), image = image + "casa-taylor.png")
    
    method interactuar() = dialogos
    
    method mostrar() {
    	game.addVisual(self)
    }
    
}


class Casa inherits CasaNoJugable {
    var mapa = ""
    var elemento = null
    
    var interaccion = { irA.interactuar(self) }
    override method interactuar() = interaccion

	method zonas() = [new Zona(xIni = 0, xFin = 29, yIni = 0, yFin = 19)]

    method cargarInterior() {
        game.addVisual(propietario)
        self.evaluarCondiciones(elemento)
    }

    method evaluarCondiciones(objeto) {
        if (!susana.tiene(objeto) && !susana.tuvo(objeto)) game.addVisual(objeto)
        game.addVisualIn(puerta, game.at(10,5))
    }
}

const casaMessi = new Casa(position = game.at(18,7), image = "vecindad/casa-messi.png", propietario = messi, elemento = botines)
const carcelMoria = new Casa(position = game.at(24,17), image = "vecindad/carcel.png", propietario = moria, elemento = martinFierro)


object vecindad {
	const mapa = "vecindad/vecindad-map.png"

	method zonas() = [new Zona(xIni = 0, xFin = 29, yIni = 0, yFin = 19)]
	
	method generar() {
        game.boardGround(mapa)
     // casas.forEach({ casa => casa.mostrar() })
     // casaMessi.mostrar()
    }
}

object irA {
	method interactuar(lugar) {
		nivel.cargarMapa(lugar)
	}
}

object accederCarcel {
    method interactuar() {
        if(susana.tuvo(botines)) {
            nivel.cargarMapa(carcelMoria)
        } else {
            game.say(susana, "Primero debo hablar con Messi")
        }
    }
}

object dialogos {
	method casaMessi() {game.say(casaMessi, "Casa de Messi")}
	method carcelMoria() {game.say(carcelMoria, "Carcel")}
//	method casaEscudero() {game.say(casaEscudero, "Casa de Silvina Escudero")}
//	method casaFort() {game.say(casaFort, "Casa de Ricky Fort")}
//	method casaPimpinela() {game.say(casaPimpinela, "Casa de Pimpinela")}
//	method casaTaylor() {game.say(casaTaylor, "Casa de Taylor Swift")}
}
