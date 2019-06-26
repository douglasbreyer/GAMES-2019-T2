package;

import flixel.util.FlxColor;
import flixel.*;

class Ammunition extends FlxSprite{

    public function new(){
		super();
		loadGraphic(AssetPaths.municao__png, true, 48, 48);
	}

    override public function update(elapsed:Float):Void{
        if(!this.isOnScreen()){
            this.kill();
        }
        super.update(elapsed);
    }
}