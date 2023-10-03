// basically the stuff for the custom options

function onPlayerHit(a){
    if (FlxG.save.data.hitsound){
        if (!a.note.isSustainNote){
            FlxG.sound.play(Paths.sound('hitsound'), 0.2);
        }
    }
}

function onCountdown(event:CountdownEvent) {
    if (FlxG.save.data.middlescroll){
        if (event.swagCounter == 0){
            for (i in playerStrums.members){
                i.x -= 320;
            }
            for (i in cpuStrums.members){
                i.x -= 5000;
            }
        }
    }

    if (FlxG.save.data.opponentNotes){
        for (i in cpuStrums.members){
            i.x -= 5000;
        }
    }
}