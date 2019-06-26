package;

import flixel.util.FlxColor;
import flixel.*;

class Chefao extends FlxSprite{

     public function new(){
		super();
		loadGraphic(AssetPaths.foto__png, true, 60, 88);
        health = 3;
    }

    override public function update(elapsed:Float):Void{
        if(!this.isOnScreen()){
            this.kill();
        }

        if(health <=0 ) {
            kill();
        }

        super.update(elapsed);
    }
}