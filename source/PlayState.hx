package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxUINumericStepper as Stepper;
import flixel.graphics.frames.FlxAtlasFrames as FunAtlas;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	public static var instance:PlayState;

	var bg:FlxSprite;

	var gnd:FlxSprite;

	// var logo:FlxSprite;
	var player:Player;

	var debug_t:FlxText;

	public static var curStage:String = "shop";

	var playerPos:FlxPoint;

	var stageBounds:Array<FlxPoint> = [];

	var bubble:NPC.Dialogue;

	var bubbleDialogue:String = "";

	var arrow:NPC.Arrow;

	var haveDia:Bool = true;

	var shoes:Bool = true;

	var loaded:Bool = false;

	var tasks:Array<Dynamic> = [];

	var onGnd:Bool = true;

	var gndY:Float = 0;

	override public function create()
	{
		FlxG.watch.add(FlxG.mouse, "x");
		FlxG.watch.add(FlxG.mouse, "y");

		// logo = new FlxSprite(250,80);
		// logo.frames = Files.xml("assets/images/title/logo");
		// logo.animation.addByPrefix("logo","Basically A Walking Simulator");
		// logo.animation.play("logo");
		// add(logo);

		playerPos = new FlxPoint(515, 400);
		stageBounds = [new FlxPoint(0, 0), new FlxPoint(1800, 720)];

		loadStage(curStage);

		player = new Player(playerPos.x, playerPos.y, "normal");
		add(player);

		bubble = new NPC.Dialogue(520, 175, "fancy");
		add(bubble);
		bubble.alpha = 0.1;
		bubble.color = BawsUtil.diaBlue;

		arrow = new NPC.Arrow(520 + (bubble.width / 2), 175 - (bubble.height / 1.5), "arrow");
		add(arrow);
		// arrow.screenCenter();
		arrow.alpha = 0.1;
		arrow.color = BawsUtil.diaBlue;
		arrow.x -= arrow.width / 2;
		arrow.blend = "invert";

		debug_t = new FlxText(550, 210, 480, bubbleDialogue, 32);
		// debug_t.screenCenter(X);
		debug_t.setFormat(32, FlxColor.WHITE, LEFT, OUTLINE, FlxColor.BLACK);
		debug_t.borderSize = 4;
		debug_t.applyMarkup(debug_t.text, BawsUtil.markup);
		debug_t.alpha = 0.1;
		add(debug_t);

		if (!haveDia)
		{
			debug_t.visible = false;
			bubble.visible = false;
			arrow.visible = false;
		}

		// var overlay = new FlxSprite(0, 0).makeGraphic(1280, 720, 0xFF464ABD);
		// overlay.blend = "overlay";
		// add(overlay);

		super.create();

		FlxG.watch.add(player, "speed");

		FlxG.camera.setScrollBoundsRect(0, 0, stageBounds[1].x, stageBounds[1].y);
		FlxG.camera.follow(player, TOPDOWN, 10);

		for (i in 0...tasks.length)
		{
			tasks[i]();
			trace("task " + i + " done!");
		}
		gndY = player.y;
	}

	public function setSpeechPos(x:Float, y:Float = 175)
	{
		bubble.x = x;
		debug_t.x = x + 30;
		bubble.y = y;
		debug_t.y = y + 25;
	}

	function changeDebugTXT(txt:String)
	{
		if (debug_t != null)
		{
			debug_t.text = txt;
			debug_t.applyMarkup(debug_t.text, BawsUtil.markup);
		}
		bubbleDialogue = txt;
	}

	public function npc_check(npc):Bool
	{
		if (FlxG.overlap(npc, player) || FlxG.mouse.overlaps(npc))
			return true;
		else
			return false;
	}

	public function move(amt:Float):Bool // did you successfully move?
	{
		var successful = true;
		if (shoes)
		{
			player.x += amt + player.speed;

			if (player.x > stageBounds[1].x)
			{
				successful = false;
				player.x -= (amt + player.speed);
			}
			if (player.x < stageBounds[0].x)
			{
				successful = false;
				player.x -= (amt + player.speed);
			}
		}
		else
		{
			player.x += amt;

			if (player.x > stageBounds[1].x)
			{
				successful = false;
				player.x -= amt;
			}
			if (player.x < stageBounds[0].x)
			{
				successful = false;
				player.x -= amt;
			}
		}
		return successful;
	}

	override public function update(elapsed:Float)
	{
		instance = this;

		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.switchState(new PlayState());
		}

		if (FlxG.keys.pressed.LEFT && move(-5))
		{
			player.flipX = true;
			if (onGnd)
			{
				if (player.speed < -15)
					player.playAnim("run");
				else if (player.speed > 15)
					player.playAnim("dizzy");
				else
					player.playAnim("walk");
			}
			if (player.speed > -player.cap)
				player.speed -= (player.inc);
			if (player.speed < -player.cap)
				player.speed = -player.cap;
		}
		else if (FlxG.keys.pressed.RIGHT && move(5))
		{
			player.flipX = false;
			if (onGnd)
			{
				if (player.speed > 15)
					player.playAnim("run");
				else if (player.speed < -15)
					player.playAnim("dizzy");
				else
					player.playAnim("walk");
			}
			if (player.speed < player.cap)
				player.speed += (player.inc);
			if (player.speed > player.cap)
				player.speed = player.cap;
		}
		else // if (player.animation.curAnim.name == "walk")
		{
			player.flipX = false;
			if (onGnd)
				player.playAnim("idle");
			player.speed = 0;
		}

		if (!onGnd)
		{
			player.y -= player.jumpSpeed;
			if (Math.abs(player.speed) > 15)
				player.playAnim("fly");
			else
				player.playAnim("jump");
			if (player.y > gndY)
			{
				player.y = gndY;
				onGnd = true;
				player.jumpSpeed = 0;
			}
		}

		if (Math.abs(player.speed) > 15)
			player.jumpSpeed -= 0.3;
		else
			player.jumpSpeed -= 0.5;

		if (FlxG.keys.justPressed.SPACE && onGnd)
		{
			player.y -= 5;
			player.jumpSpeed = 10;
			onGnd = false;
		}

		super.update(elapsed);
	}

	public function bubbleFadeIn()
	{
		new FlxTimer().start(0.025, function(tmr:FlxTimer)
		{
			if (bubble.alpha < 1)
			{
				debug_t.alpha += 0.1;
				bubble.alpha += 0.1;
				arrow.alpha += 0.1;
				tmr.reset();
			}
		});
	}

	public function bubbleFadeColor(time:Float, color:FlxColor)
	{
		FlxTween.completeTweensOf(bubble);
		FlxTween.completeTweensOf(arrow);
		FlxTween.color(bubble, time, bubble.color, color, {type: FlxTweenType.ONESHOT, ease: FlxEase.cubeInOut});
		FlxTween.color(arrow, time, arrow.color, color, {type: FlxTweenType.ONESHOT, ease: FlxEase.cubeInOut});
	}

	public function arrowMove(time:Float, pos:FlxPoint)
	{
		FlxTween.tween(arrow, {x: pos.x, y: pos.y}, time, {ease: FlxEase.sineOut});
	}

	public function spr_pos(spr:FlxSprite):FlxPoint
	{
		return new FlxPoint((spr.x + spr.width / 2) - arrow.width / 2, ((spr.y + spr.height / 2) - 200));
	}

	public function timeout(time:Float, func:Void->Void):FlxTimer
	{
		var timer:FlxTimer;
		new FlxTimer().start(time, function(tmr:FlxTimer)
		{
			func();
			timer = tmr;
		});
		return timer;
	}

	public function travel(area:String)
	{
		curStage = area;
		FlxG.resetState();
	}

	public function afterLoad(func:Void->Void)
	{
		tasks.push(func);
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
			case "mirror":
				FlxG.sound.playMusic(Files.ost("Fields - New Beginnings"));
				bg = new FlxSprite(0, 0).makeGraphic(1280, 720, FlxColor.WHITE);
				bg.scrollFactor.set(0, 0);
				add(bg);
				gnd = new FlxSprite(-100, 620).loadGraphic("assets/images/mirror/gnd.png");
				add(gnd);
				for (i in 0...500)
				{
					var g = new FlxSprite(-100 + (2534 * i), 620).loadGraphic("assets/images/mirror/gnd.png");
					add(g);
				}
				stageBounds[0].set(0, 0);
				stageBounds[1].set(Math.pow(10, 50), 720);
				bubbleFadeIn();
				var capStepper:Stepper;
				afterLoad(function()
				{
					capStepper = new Stepper(bubble.x + bubble.width * 0.2, spr_pos(player).y, 1, player.cap, -Math.pow(10, 50), Math.pow(10, 50));
					add(capStepper);
					// capStepper.width *= 2;
				});
				new FlxTimer().start(0, function(tmr:FlxTimer)
				{
					setSpeechPos(player.x);
					changeDebugTXT("X: [p]" + player.x + "[p]\nSpeed: [g]" + player.speed + "[g]");

					arrow.x = spr_pos(player).x;
					arrow.y = spr_pos(player).y;

					capStepper.x = bubble.x + bubble.width * 0.2;
					capStepper.y = spr_pos(player).y - 100;

					player.cap = capStepper.value;

					/*if (player.x > (gnd.x + gnd.width * 1.6))
							gnd.x = player.x + 1221;
						if (player.x > (gnd2.x + gnd2.width * 1.6))
							gnd2.x = player.x + 1221; */

					tmr.reset();
				});
			case "run-cutscene":
				FlxG.sound.playMusic(Files.ost("Fields - New Beginnings"));
				bg = new FlxSprite(0, 0).loadGraphic("assets/images/title/bg.png");
				bg.scrollFactor.set(0, 0);
				add(bg);
				gnd = new FlxSprite(-100, 0).loadGraphic("assets/images/title/ground.png");
				add(gnd);
				for (i in 0...500)
				{
					var g = new FlxSprite(-100 + (3055 * i), 0).loadGraphic("assets/images/title/ground.png");
					add(g);
				}
				stageBounds[0].set(0, 0);
				stageBounds[1].set(Math.pow(10, 50), 720);
				bubbleFadeIn();
				var capStepper:Stepper;
				afterLoad(function()
				{
					capStepper = new Stepper(bubble.x + bubble.width * 0.2, spr_pos(player).y, 1, player.cap, -Math.pow(10, 50), Math.pow(10, 50));
					add(capStepper);
					// capStepper.width *= 2;
				});
				new FlxTimer().start(0, function(tmr:FlxTimer)
				{
					setSpeechPos(player.x);
					changeDebugTXT("X: [p]" + player.x + "[p]\nSpeed: [g]" + player.speed + "[g]");

					arrow.x = spr_pos(player).x;
					arrow.y = spr_pos(player).y;

					capStepper.x = bubble.x + bubble.width * 0.2;
					capStepper.y = spr_pos(player).y - 100;

					player.cap = capStepper.value;

					/*if (player.x > (gnd.x + gnd.width * 1.6))
							gnd.x = player.x + 1221;
						if (player.x > (gnd2.x + gnd2.width * 1.6))
							gnd2.x = player.x + 1221; */

					tmr.reset();
				});
			case "shop":
				playerPos.set(530, 445);

				stageBounds[0].set(0, 0);
				stageBounds[1].set(735, 720);

				// FlxG.camera.setScrollBoundsRect(0, 0, 1800, 1800);

				FlxG.sound.playMusic(Files.ost("Mountains"));

				bg = new FlxSprite(0, 0).loadGraphic("assets/images/mountains/bg.png");
				bg.scrollFactor.x = 0.05;
				bg.screenCenter();
				add(bg);

				var wall = new FlxSprite(-80, -90).loadGraphic("assets/images/shop/bg.png");
				wall.screenCenter();
				add(wall);

				changeDebugTXT("...");

				var cashier = new NPC(1080, 450, "cashier", true);
				cashier.interact = function()
				{
					switch (cashier.interactions)
					{
						case 1:
							bubbleFadeIn();
							cashier.playAnim("money");
							arrowMove(0.5, spr_pos(cashier));
							changeDebugTXT("What would you like\n today?");
						case 2:
							bubbleFadeColor(0.3, 0xFFBF6363);
							arrowMove(0.5, spr_pos(player));
							changeDebugTXT("");
							player.playAnim("smile");
						case 3:
							bubbleFadeColor(0.3, FlxColor.LIME);
							arrowMove(0.5, spr_pos(cashier));
							changeDebugTXT("[g]( YES! I'm finally going to get [i]paid![i] )[g]");
					}
				}
				add(cashier);

				var desk = new FlxSprite(-50, -100).loadGraphic("assets/images/shop/Cashier Desk.png");
				// desk.screenCenter();
				add(desk);

			case "mountains":
				// FlxG.sound.playMusic(Files.ost("Mountains"));
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
				var nicky = new NPC(785, 325, "nicky", true);
				nicky.interact = function()
				{
					switch (nicky.interactions)
					{
						case 1:
							bubbleFadeIn();
							changeDebugTXT("Hey..");
						case 2:
							changeDebugTXT("Have you seen anyone around named [p]Kulnamlo[p]?");
						case 3:
							bubbleFadeColor(0.2, 0xFF4b1818);
							changeDebugTXT("Stay away from him. He's done some pretty bad things.");
							player.playAnim("shock");
							FlxG.sound.play(Files.sound("twist"));
						case 4:
							player.playAnim("idle");
							/*
								timeout(5, function()
								{
									player.playAnim("idle");
							});*/ bubbleFadeColor(1, BawsUtil.diaBlue);
							nicky.playAnim("happy");
							changeDebugTXT("Just kidding. He's pretty cool if you get to know him.");
					}
				}
				add(nicky);
		}
	}
}
