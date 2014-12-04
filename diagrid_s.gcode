;(****Build and Slicing Parameters****)
;(Pix per mm X            = 26.25174 px/mm )
;(Pix per mm Y            = 26.25182 px/mm )
;(X Resolution            = 1920 )
;(Y Resolution            = 1080 )
;(X Pixel Offset          = 0 px )
;(Y Pixel Offset          = 0 px )
;(Layer Thickness         = 0.10000 mm )
;(Layer Time              = 4000 ms )
;(Bottom Layers Time        = 15000 ms )
;(Number of Bottom Layers = 3 )
;(Blanking Layer Time     = 5100 ms )
;(Build Direction         = Bottom_Up)
;(Lift Distance           = 3 mm )
;(Slide/Tilt Value        = 0)
;(Anti Aliasing           = True)
;(Use Mainlift GCode Tab  = False)
;(Anti Aliasing Value     = 1.5 )
;(Z Lift Feed Rate        = 100.00000 mm/s )
;(Z Lift Retract Rate     = 100.00000 mm/s )
;(Flip X                  = False)
;(Flip Y                  = True)
;Number of Slices        =  66
;(****Machine Configuration ******)
;(Platform X Size         = 73.138mm )
;(Platform Y Size         = 41.14mm )
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
;<Delay> 15000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 1 
;<Delay> 15000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 2 
;<Delay> 15000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 3 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 4 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 5 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 6 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 7 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 8 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 9 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 10 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 11 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 12 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 13 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 14 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 15 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 16 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 17 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 18 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 19 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 20 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 21 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 22 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 23 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 24 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 25 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 26 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 27 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 28 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 29 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 30 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 31 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 32 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 33 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 34 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 35 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 36 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 37 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 38 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 39 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 40 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 41 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 42 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 43 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 44 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 45 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 46 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 47 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 48 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 49 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 50 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 51 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 52 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 53 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 54 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 55 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 56 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 57 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 58 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 59 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 60 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 61 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 62 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 63 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 64 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Pre-Slice Start ********
;Set up any GCode here to be executed before a lift
;********** Pre-Slice End **********
;<Slice> 65 
;<Delay> 4000 
;<Slice> Blank 
;********** Lift Sequence ********
G4 P1500;
G1 Z3.0 F100.0
G1 Z-2.9 F100.0
;<Delay> 5100
;********** Lift Sequence **********
;********** Footer Start ********
;Here you can set any G or M-Code which should be executed after the last Layer is Printed
M18 ;Disable Motors
;<Completed>
;********** Footer End ********
