videoplayermodule = {name: "videoplayermodule"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["videoplayermodule"]?  then console.log "[videoplayermodule]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion

############################################################
playerFactory = require("videomat-videoplayer")

############################################################
videoplayermodule.initialize = ->
    log "videoplayermodule.initialize"

    testRegularSingle()
    testRegularMulti()
    testAutoplaySingle()
    testAutoplayMulti()
    return
    
############################################################
testAutoplaySingle = ->
    # videoplayerAutoplay.
    options = 
        elements: videoplayerAutoplay
        mode: "autoplay"
        randostart: true

    playerAutoplaySingle = playerFactory.create(options)
    return

testAutoplayMulti = ->
    options = 
        elements: ".videoplayer-autoplay"
        mode: "autoplay"
        randostart: true
        
    playerAutoplayMulti = playerFactory.create(options)
    return

testRegularSingle = ->
    # videoplayer.
    options = 
        elements: videoplayer
        
    playerRegularSingle = playerFactory.create(options)
    return

testRegularMulti = ->
    options = 
        elements: ".videoplayer"
        
    playerRegularMulti = playerFactory.create(options)
    return

module.exports = videoplayermodule