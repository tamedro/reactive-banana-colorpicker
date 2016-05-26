{-----------------------------------------------------------------------------
    FRP Color Picker
------------------------------------------------------------------------------}

import Data.Maybe

import Graphics.UI.WX hiding (Event)
import Reactive.Banana
import Reactive.Banana.WX

main :: IO ()
main = start $ do
    f         <- frame [text := "Color Picker"]
    input1    <- entry f []
    input2    <- entry f []
    input3    <- entry f []
    output    <- staticText f []
    
    set f [ layout := margin 10 $ row 10 
                [ column 20 
                    [ label "Red"
                    , widget input1
                    , label "Green"
                    , widget input2
                    , label "Blue"
                    , widget input3
                    ]
                    , column 40 [minsize (sz 40 40) $ label ""]
                    , column 20 [ 
                        row 50 [label ""]
                        , label "Result"
                        , minsize (sz 50 50) $ widget output
                    ]     
                ] 
            ]

    let networkDescription :: MomentIO ()
        networkDescription = do
        
        binput1  <- behaviorText input1 ""
        binput2  <- behaviorText input2 ""
        binput3  <- behaviorText input3 ""
        
        let
            resultColor = colorRGB 
                <$> (giveNumber <$> binput1) 
                <*> (giveNumber <$> binput2) 
                <*> (giveNumber <$> binput3)

            readNumber s = listToMaybe [x | (x,"") <- reads s]
            giveNumber n = let res = readNumber n    
                            in case res of
                                Nothing -> 0
                                Just val -> if val < 0 then 0
                                            else if val > 255 then 255
                                            else val

        sink output [textBgcolor :== resultColor]   

    network <- compile networkDescription    
    actuate network