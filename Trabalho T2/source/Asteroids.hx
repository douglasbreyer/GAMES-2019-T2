package;

import flixel.math.FlxPoint;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSpriteUtil; 
import flixel.math.FlxRandom; 
import flixel.math.FlxAngle;

class Asteroids extends FlxSprite{
	var VELOCIDADE:Float = 150;
	var random = new FlxRandom();

	function movimento() {
		velocity.x = random.float(50, 150);
		velocity.y = VELOCIDADE;
		angularVelocity = 200;
        var point = FlxPoint.get(100 + velocity.x, 100 + velocity.y);
        //var pivot = FlxPoint.weak(150, 150);
        //point.rotate(pivot, angle);
        
		FlxSpriteUtil.screenWrap(this); //reaparecer na tela
	}
	
    public function new()
    {
		
		super(FlxG.random.float(0, 500), FlxG.random.float(0, 500));

		loadGraphic(AssetPaths.asteroid__png, true, 64, 64);
		angle = FlxG.random.float(0, 1000000);	
		centerOffsets();
		
    }

	public function reloadSprite() {
		loadGraphic(AssetPaths.asteroid__png, true, 64, 64);
	}

    override public function update(elapsed:Float):Void
    {
		movimento(); 
        super.update(elapsed);
    }

    override public function destroy():Void
    {
        super.destroy();
    }
}