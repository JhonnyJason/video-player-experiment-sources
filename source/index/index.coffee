import Modules from "./allmodules"

global.allModules = Modules

appStartup = ->
    ## which modules shall be kickstarted?
    return

run = ->
    promises = (m.initialize() for n,m of Modules)
    await Promise.all(promises)
    appStartup()

run()