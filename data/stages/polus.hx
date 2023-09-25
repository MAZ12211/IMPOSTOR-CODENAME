var speaker:FlxSprite;
var snow:FlxSprite;
var crowd:FlxSprite;

function create(){
    speaker = new FlxSprite(300, 195);
    speaker.frames = Paths.getSparrowAtlas('stages/polus/speakerlonely');
    speaker.animation.addByPrefix('bop', 'speakers lonely', 24, false);
    speaker.antialiasing = true;
    insert(members.indexOf(gf), speaker);
    
    snow = new FlxSprite(0, -250);
    snow.frames = Paths.getSparrowAtlas('stages/polus/snow');
    snow.animation.addByPrefix('cum', 'cum', 24);
    snow.animation.play('cum');
    snow.scrollFactor.set(1, 1);
    snow.antialiasing = true;
    snow.updateHitbox();
    snow.setGraphicSize(Std.int(snow.width * 2));
    add(snow);
    if (Options.lowMemoryMode){
        remove(snow);
    }

    crowd = new FlxSprite(-925, 250);
	crowd.frames = Paths.getSparrowAtlas('stages/polus/boppers_meltdown');
	crowd.animation.addByPrefix('bop', 'BoppersMeltdown', 24, false);
	crowd.scrollFactor.set(1.5, 1.5);
	crowd.antialiasing = true;
    
    bfdead.alpha = 0;
}

function update(){
    if (curSong == "sussus moogus"){
        remove(speaker);
    }
    if (curSong == "sabotage"){
        add(speaker);
    }
    if (curSong == "meltdown"){
        add(speaker);
        add(crowd);
        if (Options.lowMemoryMode){
            remove(crowd);
        }
        bfdead.alpha = 1;
    }
}

function beatHit(){
    speaker.animation.play('bop');
    crowd.animation.play('bop');
}