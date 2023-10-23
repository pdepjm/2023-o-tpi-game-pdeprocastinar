import wollok.game.*
import susana.*
import configuraciones.*
import escenarios.*
import personajes.*

class Elemento {
    const position = game.at(0,0)
    const image = ""
    const interaccion = { self.interactuar() }
    
    method position() = position
    method image() = image
    method interaccion() = interaccion 
    
	method mostrar() {
		if(!susana.tieneOTuvo(self)) game.addVisual(self)
	}
	
	method interactuar() {
        susana.agregarA(susana.inventario(), self)
        game.removeVisual(self)
    }
}

const botines = new Elemento(position = game.at(7,4), image = "botin.png")
const copa = new Elemento(position = game.at(7,4), image = "botin.png" )
const balonDeOro = new Elemento(position = game.at(7,4), image = "botin.png" )
const collar = new Elemento(position = game.at(7,4), image = "botin.png" )
const llaveEscudero = new Elemento(position = game.at(7,4), image = "botin.png" )
const martinFierro = new Elemento(position = game.at(7,4), image = "martinFierro.png" )

object baldosaCollide {
	method image() = "tile.png"
	
	method colision(coordenadas) {
		game.addVisualIn(self, coordenadas)
	}
}