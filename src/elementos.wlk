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
const martinFierro = new Elemento(position = game.at(7,4), image = "martinFierro.png" )
const copa = new Elemento()
const balonDeOro = new Elemento()
const collar = new Elemento()
const llaveEscudero = new Elemento()