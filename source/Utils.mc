using Toybox.WatchUi;
using Toybox.System;
using Toybox.Graphics;

module Utils {

    var myFont = null;

    function getFont() {
        if (myFont == null) {
            myFont = WatchUi.loadResource(Rez.Fonts.id_font_myFont);
        } else {
            //Sys.println("looks like font was already on mem");
        }
        return myFont; 
    }
    
}