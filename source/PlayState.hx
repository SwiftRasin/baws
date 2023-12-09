package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames as FunAtlas;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var bg:FlxSprite;

	var gnd:FlxSprite;

	// var logo:FlxSprite;
	var bawsguy:Player;

	var debug_t:FlxText;

	public static var curStage:String = "mountains";

	override public function create()
	{
		// logo = new FlxSprite(250,80);
		// logo.frames = Files.xml("assets/images/title/logo");
		// logo.animation.addByPrefix("logo","Basically A Walking Simulator");
		// logo.animation.play("logo");
		// add(logo);

		loadStage(curStage);

		bawsguy = new Player(515, 400, "normal");
		add(bawsguy);

		FlxG.camera.setScrollBoundsRect(0, 0, 1800, 720);
		FlxG.camera.follow(bawsguy, TOPDOWN, 10);

		debug_t = new FlxText(0, 200, 0, "[b]Hi there![b] \n[r]I know where you live [r]\n[y]and I will soon [y]⚠end you and all of your friends.⚠");
		debug_t.screenCenter(X);
		debug_t.setFormat(32, FlxColor.WHITE, CENTER, OUTLINE, FlxColor.BLACK);
		debug_t.borderSize = 4;
		debug_t.applyMarkup(debug_t.text, BawsUtil.markup);
		add(debug_t);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.switchState(new PlayState());
		}

		if (FlxG.keys.pressed.LEFT)
		{
			bawsguy.flipX = true;
			bawsguy.playAnim("walk");
			bawsguy.x -= 5;
		}
		else if (FlxG.keys.pressed.RIGHT)
		{
			bawsguy.flipX = false;
			bawsguy.playAnim("walk");
			bawsguy.x += 5;
		}
		else
		{
			bawsguy.flipX = false;
			bawsguy.playAnim("idle");
		}

		super.update(elapsed);
	}

	public function loadStage(id:String)
	{
		switch (id)
		{
			case "grasslands":
				FlxG.sound.playMusic(Files.ost("Fields - New Beginnings"));
				bg = new FlxSprite(0, 0).loadGraphic("assets/images/title/bg.png");
				add(bg);
				gnd = new FlxSprite(-100, 0).loadGraphic("assets/images/title/ground.png");
				add(gnd);
			case "mountains":
				FlxG.sound.playMusic(Files.ost("Mountains"));
				bg = new FlxSprite(0, 0).loadGraphic("assets/images/mountains/bg.png");
				bg.scrollFactor.x = 0.05;
				bg.screenCenter();
				add(bg);
				var mount = new FlxSprite(0, 0).loadGraphic("assets/images/mountains/mountains.png");
				mount.scrollFactor.x = 0.2;
				mount.screenCenter();
				add(mount);
				gnd = new FlxSprite(-90, 540).loadGraphic("assets/images/mountains/gnd.png");
				add(gnd);
				var trail = new FlxSprite(-40, 620).loadGraphic("assets/images/mountains/trail.png");
				add(trail);
		}
	}
}
