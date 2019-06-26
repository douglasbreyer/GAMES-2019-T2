package;

import flixel.util.FlxCollision;
import flixel.effects.particles.FlxEmitter;
import flixel.util.FlxColor;
import flixel.*;

class Chefao extends FlxSprite{

    var explodindo = false;
    var _explosionParticles:FlxEmitter;
    
    var xx:Float = 0;
    var yy:Float = 0;

    static var _DAMAGE:Float = 16;

     public function new(){
		super();
		loadGraphic(AssetPaths.foto__png, true, 60, 88);
        health = 3;

        _explosionParticles = new FlxEmitter(xx, yy, 100);
        _explosionParticles.lifespan.set(1, 3);
        //_explosionParticles.color.set(FlxColor.WHITE, FlxColor.ORANGE, FlxColor.RED);
        _explosionParticles.solid = true;
        _explosionParticles.alpha.set(1, 1, 0, 0);
        _explosionParticles.launchMode = FlxEmitterMode.CIRCLE;
		_explosionParticles.makeParticles(2, 2, FlxColor.ORANGE, 200);
        FlxG.state.add(_explosionParticles);

    }
    function onOverlapParticulas(a:FlxSprite, b:FlxSprite):Void{   //colisao particulas com asteroides
		var colide = FlxCollision.pixelPerfectCheck(a, b);
		if(colide){
            PlayState.asteroides.kill();

		}
    }

    override public function update(elapsed:Float):Void{
        xx = this.x;
        yy = this.y;
        if(!this.isOnScreen()){
            this.kill();
        }

        if(health <= 0 && !explodindo) {
            alpha = 0;
            _explosionParticles.start();
            explodindo = true;
        }

        if(explodindo) {
            if(!_explosionParticles.emitting) {
                kill();
            }
        }

        FlxG.overlap(_explosionParticles, PlayState.asteroides, onOverlapParticulas);

        super.update(elapsed);
    }

}