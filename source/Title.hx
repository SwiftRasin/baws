package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames as FunAtlas;

class Title extends FlxState
{
	var bg:FlxSprite;

	var gnd:FlxSprite;

	var logo:FlxSprite;

	var bawsguy:FlxSprite;

	override public function create()
	{
		// Files.setDefaultFont("Cabin Regular");
		bg = new FlxSprite(0, 0).loadGraphic("assets/images/title/bg.png");
		add(bg);
		gnd = new FlxSprite(-100, 0).loadGraphic("assets/images/title/ground.png");
		add(gnd);
		logo = new FlxSprite(250, 80);
		logo.frames = Files.xml("assets/images/title/logo");
		logo.animation.addByPrefix("logo", "Basically A Walking Simulator");
		logo.animation.play("logo");
		add(logo);
		bawsguy = new FlxSprite(515, 400);
		bawsguy.frames = Files.xml("assets/images/title/guy");
		bawsguy.animation.addByPrefix("guy", "Walking Suit");
		bawsguy.animation.play("guy");
		// bawsguy.scale.set(0.8,0.8);
		// bawsguy.updateHitbox();
		add(bawsguy);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.ENTER)
		{
			PlayState.curStage = "shop";
			FlxG.switchState(new PlayState());
		}
		super.update(elapsed);
	}
}
