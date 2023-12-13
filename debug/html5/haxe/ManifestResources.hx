package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_cabin_bold_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_cabin_bolditalic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_cabin_italic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_cabin_medium_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_cabin_mediumitalic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_cabin_regular_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_cabin_semibold_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_cabin_semibolditalic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR2i172576R3y4:FONTy9:classNamey36:__ASSET__assets_fonts_cabin_bold_ttfR5y31:assets%2Ffonts%2FCabin-Bold.ttfR6tgoR2i176992R3R7R8y42:__ASSET__assets_fonts_cabin_bolditalic_ttfR5y37:assets%2Ffonts%2FCabin-BoldItalic.ttfR6tgoR2i190744R3R7R8y38:__ASSET__assets_fonts_cabin_italic_ttfR5y33:assets%2Ffonts%2FCabin-Italic.ttfR6tgoR2i176076R3R7R8y38:__ASSET__assets_fonts_cabin_medium_ttfR5y33:assets%2Ffonts%2FCabin-Medium.ttfR6tgoR2i183844R3R7R8y44:__ASSET__assets_fonts_cabin_mediumitalic_ttfR5y39:assets%2Ffonts%2FCabin-MediumItalic.ttfR6tgoR2i188320R3R7R8y39:__ASSET__assets_fonts_cabin_regular_ttfR5y34:assets%2Ffonts%2FCabin-Regular.ttfR6tgoR2i173020R3R7R8y40:__ASSET__assets_fonts_cabin_semibold_ttfR5y35:assets%2Ffonts%2FCabin-SemiBold.ttfR6tgoR2i181880R3R7R8y46:__ASSET__assets_fonts_cabin_semibolditalic_ttfR5y41:assets%2Ffonts%2FCabin-SemiBoldItalic.ttfR6tgoR0y41:assets%2Fimages%2Fcharacter%2Fcashier.pngR2i74622R3y5:IMAGER5R25R6tgoR0y41:assets%2Fimages%2Fcharacter%2Fcashier.xmlR2i3656R3R4R5R27R6tgoR0y39:assets%2Fimages%2Fcharacter%2Fnicky.pngR2i422010R3R26R5R28R6tgoR0y39:assets%2Fimages%2Fcharacter%2Fnicky.xmlR2i1716R3R4R5R29R6tgoR0y40:assets%2Fimages%2Fcharacter%2Fnormal.pngR2i186325R3R26R5R30R6tgoR0y40:assets%2Fimages%2Fcharacter%2Fnormal.xmlR2i8820R3R4R5R31R6tgoR0y38:assets%2Fimages%2Fdialogue%2Farrow.pngR2i2931R3R26R5R32R6tgoR0y38:assets%2Fimages%2Fdialogue%2Farrow.xmlR2i762R3R4R5R33R6tgoR0y39:assets%2Fimages%2Fdialogue%2Fbubble.pngR2i12738R3R26R5R34R6tgoR0y39:assets%2Fimages%2Fdialogue%2Fbubble.xmlR2i684R3R4R5R35R6tgoR0y38:assets%2Fimages%2Fdialogue%2Ffancy.pngR2i14905R3R26R5R36R6tgoR0y38:assets%2Fimages%2Fdialogue%2Ffancy.xmlR2i524R3R4R5R37R6tgoR0y36:assets%2Fimages%2Fimages-go-here.txtR2zR3R4R5R38R6tgoR0y36:assets%2Fimages%2Fmountains%2Fbg.pngR2i721866R3R26R5R39R6tgoR0y37:assets%2Fimages%2Fmountains%2Fgnd.pngR2i26546R3R26R5R40R6tgoR0y43:assets%2Fimages%2Fmountains%2Fmountains.pngR2i84654R3R26R5R41R6tgoR0y39:assets%2Fimages%2Fmountains%2Ftrail.pngR2i19482R3R26R5R42R6tgoR0y31:assets%2Fimages%2Fshop%2Fbg.pngR2i16212R3R26R5R43R6tgoR0y43:assets%2Fimages%2Fshop%2FCashier%20Desk.pngR2i6718R3R26R5R44R6tgoR0y33:assets%2Fimages%2Fshop%2Fdesk.pngR2i2663R3R26R5R45R6tgoR0y32:assets%2Fimages%2Ftitle%2Fbg.pngR2i18573R3R26R5R46R6tgoR0y36:assets%2Fimages%2Ftitle%2Fground.pngR2i26330R3R26R5R47R6tgoR0y33:assets%2Fimages%2Ftitle%2Fguy.pngR2i14034R3R26R5R48R6tgoR0y33:assets%2Fimages%2Ftitle%2Fguy.xmlR2i1301R3R4R5R49R6tgoR0y34:assets%2Fimages%2Ftitle%2Flogo.pngR2i328143R3R26R5R50R6tgoR0y34:assets%2Fimages%2Ftitle%2Flogo.xmlR2i2149R3R4R5R51R6tgoR2i1892050R3y5:MUSICR5y32:assets%2Fmusic%2FCountryside.oggy9:pathGroupaR53hR6tgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R55R6tgoR2i2238315R3R52R5y32:assets%2Fmusic%2FprotoFields.oggR54aR56hR6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R57R6tgoR2i2114R3R52R5y26:flixel%2Fsounds%2Fbeep.mp3R54aR58y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R52R5y28:flixel%2Fsounds%2Fflixel.mp3R54aR60y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3y5:SOUNDR5R59R54aR58R59hgoR2i33629R3R62R5R61R54aR60R61hgoR2i15744R3R7R8y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R7R8y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R26R5R67R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R26R5R68R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_bold_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_bolditalic_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_italic_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_medium_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_mediumitalic_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_regular_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_semibold_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_semibolditalic_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_character_cashier_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_character_cashier_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_character_nicky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_character_nicky_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_character_normal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_character_normal_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_arrow_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_bubble_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_bubble_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_fancy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_fancy_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mountains_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mountains_gnd_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mountains_mountains_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mountains_trail_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_shop_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_shop_cashier_desk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_shop_desk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title_ground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title_guy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title_guy_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title_logo_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_countryside_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_protofields_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:font("debug/html5/obj/webfont/Cabin-Bold.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_bold_ttf extends lime.text.Font {}
@:keep @:font("debug/html5/obj/webfont/Cabin-BoldItalic.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_bolditalic_ttf extends lime.text.Font {}
@:keep @:font("debug/html5/obj/webfont/Cabin-Italic.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_italic_ttf extends lime.text.Font {}
@:keep @:font("debug/html5/obj/webfont/Cabin-Medium.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_medium_ttf extends lime.text.Font {}
@:keep @:font("debug/html5/obj/webfont/Cabin-MediumItalic.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_mediumitalic_ttf extends lime.text.Font {}
@:keep @:font("debug/html5/obj/webfont/Cabin-Regular.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_regular_ttf extends lime.text.Font {}
@:keep @:font("debug/html5/obj/webfont/Cabin-SemiBold.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_semibold_ttf extends lime.text.Font {}
@:keep @:font("debug/html5/obj/webfont/Cabin-SemiBoldItalic.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_semibolditalic_ttf extends lime.text.Font {}
@:keep @:image("assets/images/character/cashier.png") @:noCompletion #if display private #end class __ASSET__assets_images_character_cashier_png extends lime.graphics.Image {}
@:keep @:file("assets/images/character/cashier.xml") @:noCompletion #if display private #end class __ASSET__assets_images_character_cashier_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/character/nicky.png") @:noCompletion #if display private #end class __ASSET__assets_images_character_nicky_png extends lime.graphics.Image {}
@:keep @:file("assets/images/character/nicky.xml") @:noCompletion #if display private #end class __ASSET__assets_images_character_nicky_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/character/normal.png") @:noCompletion #if display private #end class __ASSET__assets_images_character_normal_png extends lime.graphics.Image {}
@:keep @:file("assets/images/character/normal.xml") @:noCompletion #if display private #end class __ASSET__assets_images_character_normal_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/dialogue/arrow.png") @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_arrow_png extends lime.graphics.Image {}
@:keep @:file("assets/images/dialogue/arrow.xml") @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_arrow_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/dialogue/bubble.png") @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_bubble_png extends lime.graphics.Image {}
@:keep @:file("assets/images/dialogue/bubble.xml") @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_bubble_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/dialogue/fancy.png") @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_fancy_png extends lime.graphics.Image {}
@:keep @:file("assets/images/dialogue/fancy.xml") @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_fancy_xml extends haxe.io.Bytes {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/mountains/bg.png") @:noCompletion #if display private #end class __ASSET__assets_images_mountains_bg_png extends lime.graphics.Image {}
@:keep @:image("assets/images/mountains/gnd.png") @:noCompletion #if display private #end class __ASSET__assets_images_mountains_gnd_png extends lime.graphics.Image {}
@:keep @:image("assets/images/mountains/mountains.png") @:noCompletion #if display private #end class __ASSET__assets_images_mountains_mountains_png extends lime.graphics.Image {}
@:keep @:image("assets/images/mountains/trail.png") @:noCompletion #if display private #end class __ASSET__assets_images_mountains_trail_png extends lime.graphics.Image {}
@:keep @:image("assets/images/shop/bg.png") @:noCompletion #if display private #end class __ASSET__assets_images_shop_bg_png extends lime.graphics.Image {}
@:keep @:image("assets/images/shop/Cashier Desk.png") @:noCompletion #if display private #end class __ASSET__assets_images_shop_cashier_desk_png extends lime.graphics.Image {}
@:keep @:image("assets/images/shop/desk.png") @:noCompletion #if display private #end class __ASSET__assets_images_shop_desk_png extends lime.graphics.Image {}
@:keep @:image("assets/images/title/bg.png") @:noCompletion #if display private #end class __ASSET__assets_images_title_bg_png extends lime.graphics.Image {}
@:keep @:image("assets/images/title/ground.png") @:noCompletion #if display private #end class __ASSET__assets_images_title_ground_png extends lime.graphics.Image {}
@:keep @:image("assets/images/title/guy.png") @:noCompletion #if display private #end class __ASSET__assets_images_title_guy_png extends lime.graphics.Image {}
@:keep @:file("assets/images/title/guy.xml") @:noCompletion #if display private #end class __ASSET__assets_images_title_guy_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/title/logo.png") @:noCompletion #if display private #end class __ASSET__assets_images_title_logo_png extends lime.graphics.Image {}
@:keep @:file("assets/images/title/logo.xml") @:noCompletion #if display private #end class __ASSET__assets_images_title_logo_xml extends haxe.io.Bytes {}
@:keep @:file("assets/music/Countryside.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_countryside_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/music/protoFields.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_protofields_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("G:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("G:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("G:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("G:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("debug/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("debug/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_fonts_cabin_bold_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_bold_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Cabin-Bold"; #else ascender = 965; descender = -250; height = 1215; numGlyphs = 269; underlinePosition = -100; underlineThickness = 50; unitsPerEM = 1000; #end name = "Cabin Bold"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_cabin_bolditalic_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_bolditalic_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Cabin-BoldItalic"; #else ascender = 965; descender = -250; height = 1215; numGlyphs = 269; underlinePosition = -100; underlineThickness = 50; unitsPerEM = 1000; #end name = "Cabin Bold Italic"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_cabin_italic_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_italic_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Cabin-Italic"; #else ascender = 965; descender = -250; height = 1215; numGlyphs = 269; underlinePosition = -100; underlineThickness = 50; unitsPerEM = 1000; #end name = "Cabin Italic"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_cabin_medium_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_medium_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Cabin-Medium"; #else ascender = 965; descender = -250; height = 1215; numGlyphs = 269; underlinePosition = -100; underlineThickness = 50; unitsPerEM = 1000; #end name = "Cabin Medium"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_cabin_mediumitalic_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_mediumitalic_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Cabin-MediumItalic"; #else ascender = 965; descender = -250; height = 1215; numGlyphs = 269; underlinePosition = -100; underlineThickness = 50; unitsPerEM = 1000; #end name = "Cabin Medium Italic"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_cabin_regular_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_regular_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Cabin-Regular"; #else ascender = 965; descender = -250; height = 1215; numGlyphs = 269; underlinePosition = -100; underlineThickness = 50; unitsPerEM = 1000; #end name = "Cabin Regular"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_cabin_semibold_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_semibold_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Cabin-SemiBold"; #else ascender = 965; descender = -250; height = 1215; numGlyphs = 269; underlinePosition = -100; underlineThickness = 50; unitsPerEM = 1000; #end name = "Cabin SemiBold"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_cabin_semibolditalic_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_semibolditalic_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Cabin-SemiBoldItalic"; #else ascender = 965; descender = -250; height = 1215; numGlyphs = 269; underlinePosition = -100; underlineThickness = 50; unitsPerEM = 1000; #end name = "Cabin SemiBold Italic"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_bold_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_bold_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_bold_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_bolditalic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_bolditalic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_bolditalic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_italic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_italic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_italic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_medium_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_medium_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_medium_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_mediumitalic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_mediumitalic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_mediumitalic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_regular_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_regular_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_regular_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_semibold_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_semibold_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_semibold_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_semibolditalic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_semibolditalic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_semibolditalic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_bold_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_bold_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_bold_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_bolditalic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_bolditalic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_bolditalic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_italic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_italic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_italic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_medium_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_medium_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_medium_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_mediumitalic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_mediumitalic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_mediumitalic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_regular_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_regular_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_regular_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_semibold_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_semibold_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_semibold_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_semibolditalic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_semibolditalic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_semibolditalic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
