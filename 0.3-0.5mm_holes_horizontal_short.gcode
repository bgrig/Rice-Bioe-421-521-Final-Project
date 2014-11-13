;(****Build and Slicing Parameters****)
;(Pix per mm X            = 24.53988 px/mm )
;(Pix per mm Y            = 24.53988 px/mm )
;(X Resolution            = 1920 )
;(Y Resolution            = 1080 )
;(X Pixel Offset          = 0 px )
;(Y Pixel Offset          = -200 px )
;(Layer Thickness         = 0.05000 mm )
;(Layer Time              = 150000 ms )
;(Bottom Layers Time        = 300000 ms )
;(Number of Bottom Layers = 3 )
;(Blanking Layer Time     = 54300 ms )
;(Build Direction         = Bottom_Up)
;(Lift Distance           = 8 mm )
;(Slide/Tilt Value        = 0)
;(Anti Aliasing           = True)
;(Use Mainlift GCode Tab  = False)
;(Anti Aliasing Value     = 1.5 )
;(Z Lift Feed Rate        = 100.00000 mm/s )
;(Z Lift Retract Rate     = 10.00000 mm/s )
;(Flip X                  = False)
;(Flip Y                  = False)
;Number of Slices        =  39
;(****Machine Configuration ******)
;(Platform X Size         = 78.24mm )
;(Platform Y Size         = 44.01mm )
;(Platform Z Size         = 100mm )
;(Max X Feedrate          = 100mm/s )
;(Max Y Feedrate          = 100mm/s )
;(Max Z Feedrate          = 100mm/s )
;(Machine Type            = UV_DLP)
;********** Header Start ********
;Here you can set any G or M-Code which should be executed BEFORE the build process
G21 ;Set units to be mm
G91 ;Relative Positioning
M17 ;Enable motors
;********** Header End **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 0 
;<Delay> 5000
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54000
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 1 
;<Delay> 5000
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 2 
;<Delay> 5000
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 3 
;<Delay> 5000
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 4 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 5 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 6 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 7 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 8 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 9 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 10 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 11 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 12 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 13 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 14 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 15 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 16 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 17 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 18 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 19 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 20 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 21 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 22 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 23 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 24 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 25 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 26 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 27 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 28 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 29 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 30 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 31 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 32 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 33 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 34 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 35 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 36 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 37 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 38 
;<Delay> 150000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P5000;
G1 Z8.0 F100.0
G1 Z-7.95 F100.0
;<Delay> 54300
;********** Lift Sequence **********
;********** Footer Start ********
;Here you can set any G or M-Code which should be executed after the last Layer is Printed
M18 ;Disable Motors
;<Completed>
;********** Footer End ********
