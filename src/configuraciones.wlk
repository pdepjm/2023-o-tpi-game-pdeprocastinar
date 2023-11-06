import wollok.game.*
import susana.*
import escenarios.*
import personajes.*
import elementos.*
import interacciones.*

object nivel {
    method configurarTeclas() {
		keyboard.a().onPressDo( {susana.moverse(izquierda)} )
        keyboard.d().onPressDo( {susana.moverse(derecha)} )
        keyboard.w().onPressDo( {susana.moverse(arriba)} )
        keyboard.s().onPressDo( {susana.moverse(abajo)} )
    }

    method cargarMapa(mapa) {
        game.clear()
		self.configurarTeclas()

        mapa.generar()

        game.addVisual(susana)
        game.onCollideDo(susana, {algo => algo.interactuar()})
        
        mapa.agregarNoPisables()
    }
}

class Zona {
	var xIni
	var xFin	
	var yIni
	var yFin	
	
	method quedaEnZona(pos) = pos.x() >= xIni &&  pos.x() <= xFin && pos.y() >= yIni && pos.y() <= yFin
}

object inicio {
	method position() = game.at(0,0)
	method image() = "pantalla-inicial.png"
	
	method cargarPantallaInicio() {
		game.addVisual(self)
		keyboard.space().onPressDo { self.comenzar() }
	}
	
    method comenzar() {
		game.removeVisual(self)
		nivel.cargarMapa(vecindad)
	}
}

const pantallaFinal = new Visual(image = "pantalla-final.png")