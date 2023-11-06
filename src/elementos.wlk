import wollok.game.*
import susana.*
import configuraciones.*
import escenarios.*
import personajes.*
import interacciones.*

class Elemento {
    const position = game.at(0,0)
    const image = ""
    
    method position() = position
    method image() = image
    
	method mostrar() {
		if(!susana.tieneOTuvo(self)) game.addVisual(self)
	}
	
	method interactuar() {
        susana.inventario().add(self)
        game.removeVisual(self)
    }
}

const botines = new Elemento(position = game.at(25, 7), image = "elementos/botin.png")
const martinFierro = new Elemento(position = game.at(26,5), image = "elementos/martinFierro.png" )
const copa = new Elemento()
const balonDeOro = new Elemento()
const collar = new Elemento()
const llaveEscudero = new Elemento()
const torta = new Elemento()
const veneno = new Elemento()