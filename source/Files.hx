package;

import flixel.FlxG; // good ol' global lib!
import flixel.graphics.frames.FlxAtlasFrames as FunAtlas; // ughhhh I've used it so much I've memorized the import path lmfao
import flixel.system.FlxAssets;

using StringTools;

class Files
{
	public static function setDefaultFont(font:String)
	{
		FlxAssets.FONT_DEFAULT = font;
		FlxAssets.FONT_DEBUGGER = font;
	}

	public static function xml(file_path:String)
	{
		return FunAtlas.fromSparrow(file_path + ".png", file_path + ".xml"); // fun fun fun fun fun fun fun atlas
	}

	public static function char(name:String)
	{
		var path:String = "assets/images/character/" + name;
		return FunAtlas.fromSparrow(path + ".png", path + ".xml");
	}

	public static function dialogue(name:String)
	{
		var path:String = "assets/images/dialogue/" + name;
		return FunAtlas.fromSparrow(path + ".png", path + ".xml");
	}

	public static function ost(song) // convert between OST and actual file names.
	{
		switch (song)
		{
			case "Fields - New Beginnings":
				return "assets/music/protoFields.ogg";
			case "Mountains":
				return "assets/music/Countryside.ogg";
		}
		return "";
	}

	public static function music(mus)
	{
		return "assets/music/" + mus + ".ogg";
	}

	public static function sound(snd)
	{
		return "assets/sounds/" + snd + ".ogg";
	}
}
