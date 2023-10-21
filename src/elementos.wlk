import wollok.game.*
import susana.*
import configuraciones.*
import escenarios.*

class Elemento {
    var property position = game.at(0,0)
    var image = ""
    var interaccion = interactuarElemento

    const botines = new Elemento(position = game.at(7,4), image = "botin.png")
    const copa = new Elemento(position = game.at(7,4), image = "botin.png" )
    const balonDeOro = new Elemento(position = game.at(7,4), image = "botin.png" )
    const collar = new Elemento(position = game.at(7,4), image = "botin.png" )
    const llaveEscudero = new Elemento(position = game.at(7,4), image = "botin.png" )
    const martinFierro = new Elemento(position = game.at(7,4), image = "martinFierro.png" )

    const puerta = new Elemento(position = game.at(7,4), image = "puerta.png", interaccion = interactuarPuerta)
}

object interactuarElemento {
    method interactuar() {
        susana.agregarA(susana.inventario(), self)
        game.removeVisual(self)
    }
}

object interactuarPuerta  {
	method interactuar() {
		nivel.cargarMapa(vecindad)
	}
}