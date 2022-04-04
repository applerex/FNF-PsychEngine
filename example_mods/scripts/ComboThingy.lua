local maxComb
function onCreate()
    
    makeLuaText("combo", 'Combo: 0', 200, -8, 259);
    setObjectCamera("combo", 'hud');
    setTextColor('combo', '0xffffff')
    setTextSize('combo', 20);
    addLuaText("combo");
    setTextFont('combo', "vcr.ttf")
    setTextAlignment('combo', 'center')

    
    makeLuaText("sick", 'Sicks!!: 0', 200, getProperty('combo.x'), getProperty('mCombo.y') + 30);  
    setObjectCamera("sick", 'hud');
    setTextColor('sick', '0xffffff')
    setTextSize('sick', 20);
    addLuaText("sick");
    setTextFont('sick', "vcr.ttf")
    setTextAlignment('sick', 'center')
    setProperty('sick.alpha', tonumber(0.6))

    makeLuaText("good", 'Goods!: 0', 200, getProperty('combo.x'), getProperty('sick.y') + 30);    
    setObjectCamera("good", 'hud');
    setTextColor('good', '0xffffff')
    setTextSize('good', 20);
    addLuaText("good");
    setTextFont('good', "vcr.ttf")
    setTextAlignment('good', 'center')
    setProperty('good.alpha', tonumber(0.6))


    makeLuaText("bad", 'Bads: 0', 200, getProperty('combo.x'), getProperty('good.y') + 30);    
    setObjectCamera("bad", 'hud');
    setTextColor('bad', '0xffffff')
    setTextSize('bad', 20);
    addLuaText("bad");
    setTextFont('bad', "vcr.ttf")
    setTextAlignment('bad', 'center')
    setProperty('bad.alpha', tonumber(0.6))


    makeLuaText("shit", 'Shits: 0', 200, getProperty('combo.x'), getProperty('bad.y') + 30);    
    setObjectCamera("shit", 'hud');
    setTextColor('shit', '0xffffff')
    setTextSize('shit', 20);
    addLuaText("shit");
    setTextFont('shit', "vcr.ttf")
    setTextAlignment('shit', 'center')
    setProperty('shit.alpha', tonumber(0.6))


    makeLuaText("miss", 'Misses: 0', 200, getProperty('combo.x'), getProperty('shit.y') + 30);    
    setObjectCamera("miss", 'hud');
    setTextColor('miss', '0x36eaf7')
    setTextSize('miss', 20);
    addLuaText("miss");
    setTextFont('miss', "vcr.ttf")
    setTextAlignment('miss', 'center')
    setProperty('miss.alpha', tonumber(0.8))
end

function onCreatePost()
    maxComb = 0
end


function onUpdate(elapsed)
    --if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.L') then
    --    addMisses(1)
    --end
    --setProperty('boyfriend.stunned', true)


    local combo = getProperty('combo')
    local sicks = getProperty('sicks')
    local goods = getProperty('goods')
    local bads = getProperty('bads')
    local shits = getProperty('shits')
    local misss = getProperty('songMisses')

    if maxComb < combo then
        maxComb = combo
    end

    setTextString('sick', 'Sicks!!: '.. sicks)
    setTextString('good', 'Goods!: '.. goods)
    setTextString('bad', 'Bads: '.. bads)
    setTextString('shit', 'Shits: '.. shits)
    if misses < 1 then 
        setTextString('miss', 'Misses: FC')
    else
        setTextString('miss', 'Misses: '.. misss)
    end

    if sicks ~= 0 and goods == 0 and bads == 0 and shits == 0 then
        setTextColor('sick', '36eaf7')
    elseif goods > 0 or bads > 0 or shits > 0 then
        setTextColor('sick', 'ffffff')
    end

    if goods ~= 0 and bads == 0 and shits == 0 then
        setTextColor('good', '90ee90')
    elseif bads > 0 or shits > 0 then
        setTextColor('good', 'ffffff')

    end

    if bads ~= 0 and shits == 0 then
        setTextColor('bad', 'fffecb')
    elseif shits > 0 then
        setTextColor('bad', 'ffffff')
    end


    if misss > 0 then
        setTextColor('miss', 'ff0000')
        setProperty('miss.alpha', tonumber(1))
    end

    if sicks ~= 0 then
        setProperty('sick.alpha', tonumber(1))
    end
    if goods ~= 0 then
        setProperty('good.alpha', tonumber(1))
    end
    if bads ~= 0 then
        setProperty('bad.alpha', tonumber(1))
    end
    if shits ~= 0 then
        setProperty('shit.alpha', tonumber(1))
    end

end

function goodNoteHit()
    setProperty('combo.scale.x', 1.03)
    setProperty('combo.scale.y', 1.03)
    setProperty('mCombo.scale.x', 1.03)
    setProperty('mCombo.scale.y', 1.03)
    runTimer('hited', 0.07, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
    setProperty('combo.scale.x', 1)
    setProperty('combo.scale.y', 1)
    if maxComb == getProperty('combo') then
        setProperty('mCombo.scale.x', 1)
        setProperty('mCombo.scale.y', 1)
    end
end