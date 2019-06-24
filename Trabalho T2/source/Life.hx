package;

import flixel.util.FlxColor;
import flixel.*;

class Life extends FlxSprite{

     public function new(){
		
		super();

		loadGraphic(AssetPaths.heart__png, true, 16, 16);
        //makeGraphic(50, 50, FlxColor.RED);
		centerOffsets();
		
    }

    override public function update(elapsed:Float):Void{
        if(!this.isOnScreen()){
            this.kill();
        }
        super.update(elapsed);
    }
}