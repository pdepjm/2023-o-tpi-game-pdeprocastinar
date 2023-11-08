import wollok.game.*
import susana.*
import configuraciones.*
import escenarios.*
import personajes.*
import interacciones.*

class Elemento {
    var property position = game.at(0,0)
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

const botines = new Elemento(position = game.at(8, 12), image = "elementos/botin.png")
const martinFierro = new Elemento(position = game.at(26,5), image = "elementos/martinFierro.png" )
const copa = new Elemento(position = game.center(), image = "elementos/copa.png" )
const balonDeOro = new Elemento(position = game.center(), image = "elementos/balon.png" )
const collar = new Elemento(position = game.center(), image = "elementos/collar.png" )
const llaveEscudero = new Elemento(position = game.center(), image = "elementos/llave.png" )
const torta = new Elemento(position = game.center(), image = "elementos/torta.png" )
const veneno =  new Elemento(position = game.center(), image = "elementos/veneno.png" )