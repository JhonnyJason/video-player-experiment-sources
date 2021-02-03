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
videoContainer = null
videoplayer = null
buttonFadeout = false


############################################################
videoplayermodule.initialize = () ->
    log "videoplayermodule.initialize"
    videoContainer = document.getElementById("videoContainer")
    videoplayer = document.getElementById("videoplayer")
    playButton = document.getElementById("play-button")

    playButton.addEventListener("click", playButtonClicked)
    playButton.addEventListener("transitionend", transitionEnded)
    videoplayer.addEventListener("play", onPlay)
    videoplayer.addEventListener("pause", onPause)    

    if !videoplayer.paused then setStatePlaying() 
    return
    
############################################################
playButtonClicked = ->
    log "playButtonClicked"
    playButton.classList.add("fadeout")
    buttonFadeout = true
    return

transitionEnded = ->
    log "transitionEnded"
    if buttonFadeout then videoplayer.play()
    else playButton.classList.remove("hidden")
    buttonFadeout = false
    return

onPlay = ->
    log "onPlay"
    setStatePlaying()
    return

onPause = ->
    log "onPause"
    setStatePaused()
    return

setStatePlaying = ->
    log "setStatePlaying"
    playButton.classList.add("hidden")
    videoplayer.setAttribute("controls", true)
    return

setStatePaused = ->
    log "setStatePaused"
    playButton.classList.remove("hidden")
    playButton.classList.remove("fadeout")
    videoplayer.removeAttribute("controls")
    return

module.exports = videoplayermodule