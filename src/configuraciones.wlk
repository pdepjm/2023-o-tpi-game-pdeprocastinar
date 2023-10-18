import wollok.game.*
import susana.*

object nivel {

    method configurarTeclas(zonas) {
        keyboard.a().onPressDo( {susana.moverseIzquierda(zonas)} )
        keyboard.d().onPressDo( {susana.moverseDerecha(zonas)} )
        keyboard.w().onPressDo( {susana.moverseArriba(zonas)} )
        keyboard.s().onPressDo( {susana.moverseAbajo(zonas)} )
    }

    method cargarMapa(mapa) {
        game.clear()
        self.configurarTeclas(mapa.zonas())

        game.addVisual(susana)
        game.onCollideDo(susana, {algo => algo.interactuar()})
        
        mapa.generar()

    }

}