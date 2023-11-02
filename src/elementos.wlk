import wollok.game.*
import susana.*
import configuraciones.*
import escenarios.*
import personajes.*
import interacciones.*

class Elemento {
    const position = game.at(0,0)
    const image = ""
//    const interaccion = { self.interactuar() }
    
    method position() = position
    method image() = image
//    method interaccion() = interaccion 
    
	method mostrar() {
		if(!susana.tieneOTuvo(self)) game.addVisual(self)
	}
	
	method interactuar() {
        susana.agregarA(susana.inventario(), self)
        game.removeVisual(self)
    }
}

const botines = new Elemento(position = game.at(25, 7), image = "botin.png")
const martinFierro = new Elemento(position = game.at(26,5), image = "martinFierro.png" )
const copa = new Elemento()
const balonDeOro = new Elemento()
const collar = new Elemento()
const llaveEscudero = new Elemento()
const torta = new Elemento()
const veneno = new Elemento()

// const pantallaFinal = new Elemento(position = game.at(0,0), image = "vecindad/pantalla-final.png")