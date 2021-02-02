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
playButton = null
videoFrame = null
buttonFadeout = false


############################################################
videoplayermodule.initialize = () ->
    log "videoplayermodule.initialize"
    videoplayer = document.getElementById("videoplayer")
    playButton = document.getElementById("play-button")
    videoButton = document.getElementById("video-frame")

    playButton.addEventListener("click", playButtonClicked)
    videoFrame.addEventListener("click", videoFrameClicked)
    return
    
############################################################
playButtonClicked = ->
    log "playButtonClicked"
    playButton.classList.add("fadeout")
    buttonFadeout = true
    return

videoFrameClicked = ->
    log "videoFrameClicked"
    
    return


module.exports = videoplayermodule