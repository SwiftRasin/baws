package;

import flixel.FlxG;
import flixel.text.FlxText.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;

class BawsUtil
{
	public static var markup:Array<FlxTextFormatMarkerPair> = [
		new FlxTextFormatMarkerPair(new FlxTextFormat(0x176BA3, null, null, 0x185C89), "[b]"), // Blue
		new FlxTextFormatMarkerPair(new FlxTextFormat(0x79F97E, null, null, 0x5BAE5E), "[g]"), // Green
		new FlxTextFormatMarkerPair(new FlxTextFormat(0xBB2424, null, null, 0x861F1F), "[r]"), // Red
		new FlxTextFormatMarkerPair(new FlxTextFormat(0xEDC00D, null, null, 0xAF9119), "[y]"), // Yellow
		new FlxTextFormatMarkerPair(new FlxTextFormat(null, true, null, null), "[l]"), // Bold
		new FlxTextFormatMarkerPair(new FlxTextFormat(null, null, true, null), "[i]"), // Italic
		new FlxTextFormatMarkerPair(new FlxTextFormat(0x6B0E0E, true, false, 0x3D0C0C), "⚠") // Maroon
	];
}
