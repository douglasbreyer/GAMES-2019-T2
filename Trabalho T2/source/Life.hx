package;

import flixel.util.FlxColor;
import flixel.*;

class Life extends FlxSprite{

     public function new(){
		super();
		loadGraphic(AssetPaths.heart__png, true, 48, 48);
    }

    override public function update(elapsed:Float):Void{
        if(!this.isOnScreen()){
            this.kill();
        }
        super.update(elapsed);
    }
}