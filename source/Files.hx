package;

import flixel.FlxG; // good ol' global lib!
import flixel.graphics.frames.FlxAtlasFrames as FunAtlas; // ughhhh I've used it so much I've memorized the import path lmfao

using StringTools;

class Files
{
	public static function xml(file_path:String)
	{
		return FunAtlas.fromSparrow(file_path + ".png", file_path + ".xml"); // fun fun fun fun fun fun fun atlas
	}

	public static function char(name:String)
	{
		var path:String = "assets/images/character/" + name;
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
}
