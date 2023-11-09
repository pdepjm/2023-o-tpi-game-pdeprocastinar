import wollok.game.*
import susana.*
import configuraciones.*
import escenarios.*
import personajes.*
import interacciones.*

class Elemento {
    var property position = susana.position().right(1)
    const image = ""

    method image() = image
    
	method mostrar() {
		if(!susana.tieneOTuvo(self)) game.addVisual(self)
	}
	
	method interactuar() {
		if(!susana.tiene(self)) {
	        susana.inventario().add(self)
	        game.removeVisual(self)
	    }
    }
}

const botines = new Elemento(position = game.at(8,13), image = "elementos/botin.png" )
const martinFierro = new Elemento(position = game.at(26,5), image = "elementos/martinFierro.png" )
const copa = new Elemento(image = "elementos/copa.png" )
const balonDeOro = new Elemento(image = "elementos/balon.png" )
const collar = new Elemento(image = "elementos/collar.png" )
const llaveEscudero = new Elemento(image = "elementos/llave.png" )
const torta = new Elemento(image = "elementos/torta.png" )
const veneno =  new Elemento(image = "elementos/veneno.png" )