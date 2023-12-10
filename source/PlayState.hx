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
	public static var instance:PlayState;

	var bg:FlxSprite;

	var gnd:FlxSprite;

	// var logo:FlxSprite;
	var player:Player;

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

		player = new Player(515, 400, "normal");
		add(player);

		FlxG.camera.setScrollBoundsRect(0, 0, 1800, 720);
		FlxG.camera.follow(player, TOPDOWN, 10);

		debug_t = new FlxText(0, 200, 0, "Hello?");
		debug_t.screenCenter(X);
		debug_t.setFormat(32, FlxColor.WHITE, CENTER, OUTLINE, FlxColor.BLACK);
		debug_t.borderSize = 4;
		debug_t.applyMarkup(debug_t.text, BawsUtil.markup);
		add(debug_t);

		super.create();
	}

	function changeDebugTXT(txt:String)
	{
		debug_t.text = txt;
		debug_t.applyMarkup(debug_t.text, BawsUtil.markup);
	}

	public function npc_check(npc):Bool
	{
		if (FlxG.overlap(npc, player) && FlxG.keys.anyJustPressed([SPACE, UP]))
			return true;
		else
			return false;
	}

	override public function update(elapsed:Float)
	{
		instance = this;
		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.switchState(new PlayState());
		}

		if (FlxG.keys.pressed.LEFT)
		{
			player.flipX = true;
			player.playAnim("walk");
			player.x -= 5;
		}
		else if (FlxG.keys.pressed.RIGHT)
		{
			player.flipX = false;
			player.playAnim("walk");
			player.x += 5;
		}
		else
		{
			player.flipX = false;
			player.playAnim("idle");
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
				var nicky = new NPC(785, 320, "nicky", true);
				nicky.interact = function()
				{
					switch (nicky.interactions)
					{
						case 1:
							changeDebugTXT("Hi!");
						case 2:
							changeDebugTXT("Are ⚠you⚠ [b][l]the player[l][b]?");
					}
				}
				add(nicky);
		}
	}
}
