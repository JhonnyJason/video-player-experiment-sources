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
defaultVolume = 0.2
allElements = null

############################################################
videoplayermodule.initialize = ->
    log "videoplayermodule.initialize"

    # videoplayerAutoplay.
    # videoplayer.addEventListener("play", onPlay)
    # videoplayer.addEventListener("pause", onPause)
    # videoplayer.addEventListener("loadedmetadata", setRandomCurrentTime)
    
    # videoplayer.volume = 0.2
    
    # if !videoplayer.paused then setStatePlaying()

    # testRegularSingle()
    # testRegularMulti()
    # testAutoplaySingle()
    # testAutoplayMulti()
    return
    
############################################################
testAutoplaySingle = ->
    construct(videoplayerAutoplay, "autoplay", true)
    return

testAutoplayMulti = ->
    construct(".videoplayer-autoplay", "autoplay", true)
    return

testRegularSingle = ->
    construct(videoplayer)
    return

testRegularMulti = ->
    construct(".videoplayer")
    return

############################################################
#region eventListeners
onPlay = (evt) ->
    log "onPlay"
    # setStatePlaying()
    thisElement = evt.target
    el.pause() for el in allElements when el != thisElement
    return

setRandomCurrentTime = (evt) ->
    log "setRandomCurrentTime"
    el = evt.target
    el.currentTime = Math.random() * el.duration
    return

#endregion

############################################################
construct = (elements, mode = "Regular", randostart = false) ->
    log "construct"
    mode = mode.toLowerCase()
    if mode == "regular" then randostart = false
    
    if typeof elements == "string" then elements = document.querySelectorAll(elements)
    else if (!Array.isArray(elements)) then elements = [elements]
    
    if elements.length == 0 then throw new Error("No Elements Found!")
    
    for el in elements when el.nodeType != 1 or el.tagName != "VIDEO"
        throw new Error("One element wasn't a valid Video Element Node.")
    
    ## set our current elements
    allElements = elements

    # now we should have an Array with Dom Element Nodes
    if mode == "regular" then initializeRegular(elements)
    if mode == "autoplay" then initializeAutoplay(elements, randostart)
    return


############################################################
initializeAutoplay = (els, randostart) ->
    log "initializeAutoplay"
    initializeAutoplayElement(el, randostart) for el in els
    return

initializeRegular = (els) ->
    log "initialRegular"
    initializeRegularElement(el) for el in els
    return

############################################################
initializeAutoplayElement = (el, randostart) ->
    log "initializeAutoplayElement"
    # get Attributes we need
    sourceSrc = el.getAttribute("src")
    sourceType = getVideoType(sourceSrc)
    trackSrc = el.getAttribute("vtt")
    
    # remove all attributes and childs
    attributes = [...el.attributes]
    olog attributes
    for attr in attributes when attr.name != "id" and attr.name != "class"
        log attr.name
        el.removeAttribute(attr.name)

    el.innerHTML = ""
    
    # add desired attributes and childs
    sourceElement = document.createElement("SOURCE")
    sourceElement.setAttribute("src", sourceSrc)
    sourceElement.setAttribute("type", sourceType)
    trackElement = document.createElement("TRACK")
    trackElement.setAttribute("src", trackSrc)
    trackElement.setAttribute("default", true)

    # add new childs
    el.appendChild(sourceElement)
    el.appendChild(trackElement)

    # set Attributes
    el.muted = true
    el.loop = true
    el.autoplay =  true
    # el.setAttribute("controls", false)

    if randostart then el.addEventListener("loadedmetadata", setRandomCurrentTime)
    return

initializeRegularElement = (el) ->
    log "initializeRegularElement"
    # get Attributes we need
    sourceSrc = el.getAttribute("src")
    sourceType = getVideoType(sourceSrc)
    trackSrc = el.getAttribute("vtt")
    
    # remove all attributes and childs
    attributes = [...el.attributes]
    olog attributes
    for attr in attributes when attr.name != "id" and attr.name != "class"
        log attr.name
        el.removeAttribute(attr.name)

    el.innerHTML = ""
    
    # add desired attributes and childs
    sourceElement = document.createElement("SOURCE")
    sourceElement.setAttribute("src", sourceSrc)
    sourceElement.setAttribute("type", sourceType)
    trackElement = document.createElement("TRACK")
    trackElement.setAttribute("src", trackSrc)
    trackElement.setAttribute("default", true)

    # add new childs
    el.appendChild(sourceElement)
    el.appendChild(trackElement)

    # add Event Listeners
    el.addEventListener("play", onPlay)
    el.addEventListener("pause", onPause)

    # set Attributes
    el.setAttribute("controls", true)
    el.setAttribute("controlsList", "nodownload")
    # el.setAttribute("preload", "none")
    el.volume = defaultVolume
    return

############################################################
getVideoType = (source) ->
    log "getVideoType"
    last4 = source.slice(-4).toLowerCase()
    last5 = source.slice(-5).toLowerCase()

    if last4 == ".mp4" then return "video/mp4"
    if last4 == ".ogg" then return "video/ogg"
    if last5 == ".webm" then return "video/webm"
    
    throw new Error("Unknown sourcs type ("+last5+")")
    return "dafuck"


module.exports = videoplayermodule