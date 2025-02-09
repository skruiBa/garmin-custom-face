import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
using Toybox.Time;
using Toybox.Time.Gregorian;


class WatchFaceView extends WatchUi.WatchFace {
    var backgroundImage;
    var active;
    var font;
    

    function initialize() {
        WatchFace.initialize();
        // Load the background
        backgroundImage = new WatchUi.Bitmap({
            :rezId=>Rez.Drawables.backgroundImage,
        });
        font = Utils.getFont();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Get and show the current time
        var moment = Time.now();
        var date = Gregorian.info(moment, Time.FORMAT_LONG);
        var hourString = date.hour.format("%02d");
        var minuteString = date.min.format("%02d");
        var timeString = Lang.format("$1$:$2$", [hourString, minuteString]);
        

        // Draw the background
        backgroundImage.draw(dc);
        // Draw the layout
        View.onUpdate(dc);
        // Draw the time
        dc.drawText(108,108,font, timeString, Graphics.TEXT_JUSTIFY_VCENTER | Graphics.TEXT_JUSTIFY_CENTER);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }


    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
        active = true;
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
        active = false;
        
    }

}
