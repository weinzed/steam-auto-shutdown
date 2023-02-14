@echo off
TITLE Steam Auto Shutdowner
color a
:::
:::              _ _,---._
:::           ,-','       `-.___
:::          /-;'               `._
:::         /\/          ._   _,'o \
:::        ( /\       _,--'\,','"`. )
:::         |\      ,'o     \'    //\
:::         |      \        /   ,--'""`-.
:::         :       \_    _/ ,-'         `-._
:::          \        `--'  /                )
:::           `.  \`._    ,'     ________,','
:::             .--`     ,'  ,--` __\___,;'
:::              \`.,-- ,' ,`_)--'  /`.,'
:::               \( ;  | | )      (`-/
:::                 `--'| |)       |-/
:::                   | | |        | |
:::                   | | |,.,-.   | |_
:::                   | `./ /   )---`  )
:::                  _|  /    ,',   ,-'
:::                 ,'|_(    /-<._,' |--,
:::                 |    `--'---.     \/ \
:::                 |          / \    /\  \
:::               ,-^---._     |  \  /  \  \
:::            ,-'        \----'   \/    \--`.
:::           /            \              \   \
:::
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A

set /p "appid=Enter the APP ID of the game you want to check: "

:check_game_installed
    cls
    for /f "tokens=2*" %%i in ('reg query "HKCU\Software\Valve\Steam\Apps\%appid%" /v "Installed"') do set "installed=%%j"
    if "%installed%"=="1" (
        cls
        echo The game you entered has been successfully installed. Shutdowning your pc in 1 minute.
        shutdown -s -f -t 60
        exit
    ) else (
        goto check_game_installed
    )