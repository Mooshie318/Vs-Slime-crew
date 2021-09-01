package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	var skipText:FlxText;

	public var finishThing:Void->Void;

	// dialogue portraits are so annoying :(
	var firePort:FlxSprite;
	var firePortMad:FlxSprite;
	var firePortAhh:FlxSprite;
	var icyPort:FlxSprite;
	var icyPortMad:FlxSprite;
	var icyPortAhh:FlxSprite;
	var lemonyPort:FlxSprite;
	var lemonyPortMad:FlxSprite;
	var lemonyPortAhh:FlxSprite;
	var slimyPort:FlxSprite;
	var slimyPortMad:FlxSprite;
	var slimyPortAhh:FlxSprite;
	var crewPort:FlxSprite;

	var bfPort:FlxSprite;
	var bfPortMad:FlxSprite;
	var gfPort:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'icy':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('dialogueThing/dialogue-box', 'shared');
				box.animation.addByPrefix('normalOpen', 'box open', 24, false);
				box.animation.addByIndices('normal', 'box', [4], "", 24);
				box.y = 400;

			case 'fire':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('dialogueThing/dialogue-box', 'shared');
				box.animation.addByPrefix('normalOpen', 'box open', 24, false);
				box.animation.addByIndices('normal', 'box', [4], "", 24);
				box.y = 400;

			case 'slime-attack':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('dialogueThing/dialogue-box', 'shared');
				box.animation.addByPrefix('normalOpen', 'box open', 24, false);
				box.animation.addByIndices('normal', 'box', [4], "", 24);
				box.y = 400;

			case 'tutorial':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('dialogueThing/dialogue-box', 'shared');
				box.animation.addByPrefix('normalOpen', 'box open', 24, false);
				box.animation.addByIndices('normal', 'box', [4], "", 24);
				box.y = 400;
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		firePort = new FlxSprite(250, 310);
		firePort.frames = Paths.getSparrowAtlas('portraits/firePortrait');
		firePort.animation.addByPrefix('enter', 'fire dialogue', 24, false);
		firePort.updateHitbox();
		firePort.scrollFactor.set();
		add(firePort);
		firePort.visible = false;
		
		firePortMad = new FlxSprite(250, 310);
		firePortMad.frames = Paths.getSparrowAtlas('portraits/fireMadPortrait');
		firePortMad.animation.addByPrefix('enter', 'fire dialogue mad', 24, false);
		firePortMad.updateHitbox();
		firePortMad.scrollFactor.set();
		add(firePortMad);
		firePortMad.visible = false;

		firePortAhh = new FlxSprite(250, 310);
		firePortAhh.frames = Paths.getSparrowAtlas('portraits/fireAhhPortrait');
		firePortAhh.animation.addByPrefix('enter', 'fire dialogue ahh', 24, false);
		firePortAhh.updateHitbox();
		firePortAhh.scrollFactor.set();
		add(firePortAhh);
		firePortAhh.visible = false;

		icyPort = new FlxSprite(250, 310);
		icyPort.frames = Paths.getSparrowAtlas('portraits/icyPortrait');
		icyPort.animation.addByPrefix('enter', 'icy dialogue', 24, false);
		icyPort.updateHitbox();
		icyPort.scrollFactor.set();
		add(icyPort);
		icyPort.visible = false;

		icyPortMad = new FlxSprite(250, 310);
		icyPortMad.frames = Paths.getSparrowAtlas('portraits/icyMadPortrait');
		icyPortMad.animation.addByPrefix('enter', 'icy dialogue mad', 24, false);
		icyPortMad.updateHitbox();
		icyPortMad.scrollFactor.set();
		add(icyPortMad);
		icyPortMad.visible = false;

		icyPortAhh = new FlxSprite(250, 310);
		icyPortAhh.frames = Paths.getSparrowAtlas('portraits/icyAhhPortrait');
		icyPortAhh.animation.addByPrefix('enter', 'icy dialogue ahh', 24, false);
		icyPortMad.updateHitbox();
		icyPortAhh.scrollFactor.set();
		add(icyPortAhh);
		icyPortAhh.visible = false;

		lemonyPort = new FlxSprite(250, 310);
		lemonyPort.frames = Paths.getSparrowAtlas('portraits/lemonyPortrait');
		lemonyPort.animation.addByPrefix('enter', 'lemony dialogue', 24, false);
		lemonyPort.updateHitbox();
		lemonyPort.scrollFactor.set();
		add(lemonyPort);
		lemonyPort.visible = false;

		lemonyPortMad = new FlxSprite(250, 310);
		lemonyPortMad.frames = Paths.getSparrowAtlas('portraits/lemonyMadPortrait');
		lemonyPortMad.animation.addByPrefix('enter', 'lemony dialogue mad', 24, false);
		lemonyPortMad.updateHitbox();
		lemonyPortMad.scrollFactor.set();
		add(lemonyPortMad);
		lemonyPortMad.visible = false;

		lemonyPortAhh = new FlxSprite(250, 310);
		lemonyPortAhh.frames = Paths.getSparrowAtlas('portraits/lemonyAhhPortrait');
		lemonyPortAhh.animation.addByPrefix('enter', 'lemony dialogue ahh', 24, false);
		lemonyPortAhh.updateHitbox();
		lemonyPortAhh.scrollFactor.set();
		add(lemonyPortAhh);
		lemonyPortAhh.visible = false;

		slimyPort = new FlxSprite(250, 310);
		slimyPort.frames = Paths.getSparrowAtlas('portraits/slimyPortrait');
		slimyPort.animation.addByPrefix('enter', 'slimy dialogue', 24, false);
		slimyPort.updateHitbox();
		slimyPort.scrollFactor.set();
		add(slimyPort);
		slimyPort.visible = false;

		slimyPortMad = new FlxSprite(250, 310);
		slimyPortMad.frames = Paths.getSparrowAtlas('portraits/slimyMadPortrait');
		slimyPortMad.animation.addByPrefix('enter', 'slimy dialogue mad', 24, false);
		slimyPortMad.updateHitbox();
		slimyPortMad.scrollFactor.set();
		add(slimyPortMad);
		slimyPortMad.visible = false;

		slimyPortAhh = new FlxSprite(250, 310);
		slimyPortAhh.frames = Paths.getSparrowAtlas('portraits/slimyAhhPortrait');
		slimyPortAhh.animation.addByPrefix('enter', 'slimy dialogue ahh', 24, false);
		slimyPortAhh.updateHitbox();
		slimyPortAhh.scrollFactor.set();
		add(slimyPortAhh);
		slimyPortAhh.visible = false;

		crewPort = new FlxSprite(250, 40);
		crewPort.frames = Paths.getSparrowAtlas('portraits/crewPortrait');
		crewPort.animation.addByPrefix('enter', 'slime crew dialogue', 24, false);
		crewPort.updateHitbox();
		crewPort.scrollFactor.set();
		add(crewPort);
		crewPort.visible = false;

		gfPort = new FlxSprite(650, 210);
		gfPort.frames = Paths.getSparrowAtlas('portraits/gf');
		gfPort.animation.addByPrefix('enter', 'gf dialogue', 24, false);
		gfPort.updateHitbox();
		gfPort.scrollFactor.set();
		add(gfPort);
		gfPort.visible = false;

		bfPort = new FlxSprite(700, 190);
		bfPort.frames = Paths.getSparrowAtlas('portraits/bf');
		bfPort.animation.addByPrefix('enter', 'bf dialogue0', 24, false);
		bfPort.updateHitbox();
		bfPort.scrollFactor.set();
		add(bfPort);

		bfPortMad = new FlxSprite(700, 190);
		bfPortMad.frames = Paths.getSparrowAtlas('portraits/bf');
		bfPortMad.animation.addByPrefix('enter', 'bf dialogue mad', 24, false);
		bfPortMad.updateHitbox();
		bfPortMad.scrollFactor.set();
		add(bfPortMad);
		bfPortMad.visible = false;
		
		box.animation.play('normalOpen');
		box.updateHitbox();
		add(box);

		box.screenCenter(X);

		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 35);
		dropText.font = 'VCR OST Mono';
		dropText.color = 0xFFD89494;
		add(dropText);

		skipText = new FlxText(5, 10, 640, "Press SHIFT to skip dialogue", 40);
		skipText.scrollFactor.set(0, 0);
		skipText.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, FlxTextAlign.LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		skipText.borderSize = 2;
		skipText.borderQuality = 1;
		add(skipText);

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 35);
		swagDialogue.font = 'VCR OST Mono';
		swagDialogue.color = 0xFF3F2021;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (FlxG.keys.justPressed.SHIFT && !isEnding)
		{
			isEnding = true;
			finishThing();
			kill();
		}

		if (FlxG.keys.justPressed.ANY  && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();

		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{
			case 'boyfriend':
				firePort.visible = false;
				firePortMad.visible = false;
				firePortAhh.visible = false;
				icyPort.visible = false;
				icyPortMad.visible = false;
				icyPortAhh.visible = false;
				lemonyPort.visible = false;
				lemonyPortMad.visible = false;
				lemonyPortAhh.visible = false;
				slimyPort.visible = false;
				slimyPortMad.visible = false;
				slimyPortAhh.visible = false;
				crewPort.visible = false;
				gfPort.visible = false;
				bfPortMad.visible = false;
				if (!bfPort.visible)
				{
					bfPort.visible = true;
					bfPort.animation.play('enter');
				}
			case 'girlfriend':
				firePort.visible = false;
				firePortMad.visible = false;
				firePortAhh.visible = false;
				icyPort.visible = false;
				icyPortMad.visible = false;
				icyPortAhh.visible = false;
				lemonyPort.visible = false;
				lemonyPortMad.visible = false;
				lemonyPortAhh.visible = false;
				slimyPort.visible = false;
				slimyPortMad.visible = false;
				slimyPortAhh.visible = false;
				crewPort.visible = false;
				bfPort.visible = false;
				bfPortMad.visible = false;
				if (!gfPort.visible)
				{
					gfPort.visible = true;
					gfPort.animation.play('enter');
				}
			case 'fire':
				firePortMad.visible = false;
				firePortAhh.visible = false;
				icyPort.visible = false;
				icyPortMad.visible = false;
				icyPortAhh.visible = false;
				lemonyPort.visible = false;
				lemonyPortMad.visible = false;
				lemonyPortAhh.visible = false;
				slimyPort.visible = false;
				slimyPortMad.visible = false;
				slimyPortAhh.visible = false;
				crewPort.visible = false;
				bfPort.visible = false;
				gfPort.visible = false;
				bfPortMad.visible = false;
				if (!firePort.visible)
				{
					firePort.visible = true;
					firePort.animation.play('enter');
				}
			case 'firemad':
				firePort.visible = false;
				firePortAhh.visible = false;
				icyPort.visible = false;
				icyPortMad.visible = false;
				icyPortAhh.visible = false;
				lemonyPort.visible = false;
				lemonyPortMad.visible = false;
				lemonyPortAhh.visible = false;
				slimyPort.visible = false;
				slimyPortMad.visible = false;
				slimyPortAhh.visible = false;
				crewPort.visible = false;
				bfPort.visible = false;
				gfPort.visible = false;
				bfPortMad.visible = false;
				if (!firePortMad.visible)
				{
					firePortMad.visible = true;
					firePortMad.animation.play('enter');
				}
			case 'fireahh':
				firePort.visible = false;
				firePortMad.visible = false;
				icyPort.visible = false;
				icyPortMad.visible = false;
				icyPortAhh.visible = false;
				lemonyPort.visible = false;
				lemonyPortMad.visible = false;
				lemonyPortAhh.visible = false;
				slimyPort.visible = false;
				slimyPortMad.visible = false;
				slimyPortAhh.visible = false;
				crewPort.visible = false;
				bfPort.visible = false;
				gfPort.visible = false;
				bfPortMad.visible = false;
				if (!firePortAhh.visible)
				{
					firePortAhh.visible = true;
					firePortAhh.animation.play('enter');
				}
			case 'icy':
				firePort.visible = false;
				firePortMad.visible = false;
				firePortAhh.visible = false;
				icyPortMad.visible = false;
				icyPortAhh.visible = false;
				lemonyPort.visible = false;
				lemonyPortMad.visible = false;
				lemonyPortAhh.visible = false;
				slimyPort.visible = false;
				slimyPortMad.visible = false;
				slimyPortAhh.visible = false;
				crewPort.visible = false;
				bfPort.visible = false;
				gfPort.visible = false;
				bfPortMad.visible = false;
				if (!icyPort.visible)
				{
					icyPort.visible = true;
					icyPort.animation.play('enter');
				}
				case 'icymad':
				firePort.visible = false;
				firePortMad.visible = false;
				firePortAhh.visible = false;
				icyPort.visible = false;
				icyPortAhh.visible = false;
				lemonyPort.visible = false;
				lemonyPortMad.visible = false;
				lemonyPortAhh.visible = false;
				slimyPort.visible = false;
				slimyPortMad.visible = false;
				slimyPortAhh.visible = false;
				crewPort.visible = false;
				bfPort.visible = false;
				gfPort.visible = false;
				bfPortMad.visible = false;
				if (!icyPortMad.visible)
				{
					icyPortMad.visible = true;
					icyPortMad.animation.play('enter');
				}
			case 'icyahh':
				firePort.visible = false;
				firePortMad.visible = false;
				firePortAhh.visible = false;
				icyPort.visible = false;
				icyPortMad.visible = false;
				lemonyPort.visible = false;
				lemonyPortMad.visible = false;
				lemonyPortAhh.visible = false;
				slimyPort.visible = false;
				slimyPortMad.visible = false;
				slimyPortAhh.visible = false;
				crewPort.visible = false;
				bfPort.visible = false;
				gfPort.visible = false;
				bfPortMad.visible = false;
				if (!icyPortAhh.visible)
				{
					icyPortAhh.visible = true;
					icyPortAhh.animation.play('enter');
				}
				case 'lemony':
				firePort.visible = false;
				firePortMad.visible = false;
				firePortAhh.visible = false;
				icyPort.visible = false;
				icyPortMad.visible = false;
				icyPortAhh.visible = false;
				lemonyPortMad.visible = false;
				lemonyPortAhh.visible = false;
				slimyPort.visible = false;
				slimyPortMad.visible = false;
				slimyPortAhh.visible = false;
				crewPort.visible = false;
				bfPort.visible = false;
				gfPort.visible = false;
				bfPortMad.visible = false;
				if (!lemonyPort.visible)
				{
					lemonyPort.visible = true;
					lemonyPort.animation.play('enter');
				}
			case 'lemonymad':
				firePort.visible = false;
				firePortMad.visible = false;
				firePortAhh.visible = false;
				icyPort.visible = false;
				icyPortMad.visible = false;
				icyPortAhh.visible = false;
				lemonyPort.visible = false;
				lemonyPortAhh.visible = false;
				slimyPort.visible = false;
				slimyPortMad.visible = false;
				slimyPortAhh.visible = false;
				crewPort.visible = false;
				bfPort.visible = false;
				gfPort.visible = false;
				bfPortMad.visible = false;
				if (!lemonyPortMad.visible)
				{
					lemonyPortMad.visible = true;
					lemonyPortMad.animation.play('enter');
				}
				case 'lemonyahh':
				firePort.visible = false;
				firePortMad.visible = false;
				firePortAhh.visible = false;
				icyPort.visible = false;
				icyPortMad.visible = false;
				icyPortAhh.visible = false;
				lemonyPort.visible = false;
				lemonyPortMad.visible = false;
				slimyPort.visible = false;
				slimyPortMad.visible = false;
				slimyPortAhh.visible = false;
				crewPort.visible = false;
				bfPort.visible = false;
				gfPort.visible = false;
				bfPortMad.visible = false;
				if (!lemonyPortAhh.visible)
				{
					lemonyPortAhh.visible = true;
					lemonyPortAhh.animation.play('enter');
				}
			case 'slimy':
				firePort.visible = false;
				firePortMad.visible = false;
				firePortAhh.visible = false;
				icyPort.visible = false;
				icyPortMad.visible = false;
				icyPortAhh.visible = false;
				lemonyPort.visible = false;
				lemonyPortMad.visible = false;
				lemonyPortAhh.visible = false;
				slimyPortMad.visible = false;
				slimyPortAhh.visible = false;
				crewPort.visible = false;
				bfPort.visible = false;
				gfPort.visible = false;
				bfPortMad.visible = false;
				if (!slimyPort.visible)
				{
					slimyPort.visible = true;
					slimyPort.animation.play('enter');
				}
			case 'slimymad':
				firePort.visible = false;
				firePortMad.visible = false;
				firePortAhh.visible = false;
				icyPort.visible = false;
				icyPortMad.visible = false;
				icyPortAhh.visible = false;
				lemonyPort.visible = false;
				lemonyPortMad.visible = false;
				lemonyPortAhh.visible = false;
				slimyPort.visible = false;
				slimyPortAhh.visible = false;
				crewPort.visible = false;
				bfPort.visible = false;
				gfPort.visible = false;
				bfPortMad.visible = false;
				if (!slimyPortMad.visible)
				{
					slimyPortMad.visible = true;
					slimyPortMad.animation.play('enter');
				}
			case 'slimyahh':
				firePort.visible = false;
				firePortMad.visible = false;
				firePortAhh.visible = false;
				icyPort.visible = false;
				icyPortMad.visible = false;
				icyPortAhh.visible = false;
				lemonyPort.visible = false;
				lemonyPortMad.visible = false;
				lemonyPortAhh.visible = false;
				slimyPort.visible = false;
				slimyPortMad.visible = false;
				crewPort.visible = false;
				bfPort.visible = false;
				gfPort.visible = false;
				bfPortMad.visible = false;
				if (!slimyPortAhh.visible)
				{
					slimyPortAhh.visible = true;
					slimyPortAhh.animation.play('enter');
				}
			case 'crew':
				firePort.visible = false;
				firePortMad.visible = false;
				firePortAhh.visible = false;
				icyPort.visible = false;
				icyPortMad.visible = false;
				icyPortAhh.visible = false;
				lemonyPort.visible = false;
				lemonyPortMad.visible = false;
				lemonyPortAhh.visible = false;
				slimyPort.visible = false;
				slimyPortMad.visible = false;
				slimyPortAhh.visible = false;
				bfPort.visible = false;
				gfPort.visible = false;
				bfPortMad.visible = false;
				if (!crewPort.visible)
				{
					crewPort.visible = true;
					crewPort.animation.play('enter');
				}
			case 'bfmad':
				firePort.visible = false;
				firePortMad.visible = false;
				firePortAhh.visible = false;
				icyPort.visible = false;
				icyPortMad.visible = false;
				icyPortAhh.visible = false;
				lemonyPort.visible = false;
				lemonyPortMad.visible = false;
				lemonyPortAhh.visible = false;
				slimyPort.visible = false;
				slimyPortMad.visible = false;
				slimyPortAhh.visible = false;
				crewPort.visible = false;
				bfPort.visible = false;
				gfPort.visible = false;
				if (!bfPortMad.visible)
				{
					bfPortMad.visible = true;
					bfPortMad.animation.play('enter');
				}
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}