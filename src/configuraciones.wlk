import wollok.game.*
import susana.*

object nivel {

    method configurarTeclas() {
        keyboard.a().onPressDo( {susana.moverseIzquierda()} )
        keyboard.d().onPressDo( {susana.moverseDerecha()} )
        keyboard.w().onPressDo( {susana.moverseArriba()} )
        keyboard.s().onPressDo( {susana.moverseAbajo()} )
    }

    method cargarMapa(mapa) {
        game.clear()
        self.configurarTeclas()

        game.addVisual(susana)
        game.onCollideDo(susana, {algo => algo.interactuar()})
        
        mapa.generar()

    }

}