DEFINT A-Z
DECLARE SUB updScreen ()
DECLARE SUB initEditor ()

TYPE obj
    x AS INTEGER
    y AS INTEGER
    clr AS INTEGER
    id AS STRING * 3
    icon AS STRING * 1
END TYPE

DIM SHARED tool AS obj, topBar(6) AS obj
DIM SHARED console AS STRING, filen AS STRING
DIM SHARED setMode, filesrc(8,8), grid(8,8), image(32), topBarLoc, gSize

initEditor
updScreen
DO
    console = ""
    k = INP(96)
    '============set tool position
    IF k = 82 THEN 'key: INS pick
        console = "pick color"
        setMode = 2
        tool.x = 18
        tool.y = 12
        FOR i = 1 to 6
            topBar(i).clr = 12
        NEXT
        updScreen
    ELSEIF k = 73 THEN 'key: PAGEUP place
