package;

import flixel.util.FlxColor;
import flixel.*;

class Ammunition extends FlxSprite{

     public function new(){
		
		super();

		loadGraphic(AssetPaths.municao__png, true, 48, 48);
        //makeGraphic(50, 50, FlxColor.RED);
		//centerOffsets();
		
    }

    override public function update(elapsed:Float):Void{
        if(!this.isOnScreen()){
            this.kill();
        }
        super.update(elapsed);
    }
}