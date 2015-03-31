/*
    Vitamin: Stock Metal

    Models for various stock metal profiles, including:
     * Angles
     * Box section
     * Channels
     * Flat/square Bar
     * Hex bar
     * Tee section
     * Round bar
     * Round tube
     * Sheet and plate

    Dependent on the Materials vitamin

    Local Frame:
      * Centred on the origin, lying on the XY plane, height/length extending along z+
*/


// Connectors

StockMetal_Con_Def				= [ [0,0,0], [0,0,-1], 0, 0, 0];


// Materials
// ---------
// Material specification and colour

//              TypeSuffix,  Description,  Colour
Material_Alu = ["Alu",       "Aluminium",  [0.7,0.7,0.7]];
//Material_Alu5754
//Material_Alu6082T6
//Material_Alu6082T6
//Material_Alu6063T6
//Material_SS304
//Material_SS
//Material_Brass
//Material_Copper
//Material_ ??



// Types
// -----

// Profile type
StockMetal_Angle = 0;
StockMetal_Box   = 1;


// Dimensions type
StockMetal_Metric = 0;
StockMetal_Imperial = 1;

//                         TypeSuffix,       ProfileType,      Fixed Dimensions, Dim Type
StockMetal_Angle_20x20x3 = ["Angle_20x20x3", StockMetal_Angle, [20,20,3],        StockMetal_Metric  ];

StockMetal_Box_30x30x3   = ["Box_30x30x3",   StockMetal_Box,   [30,30,3],        StockMetal_Metric  ];

//StockMetal_Channel



module StockMetal() {

    vitamin("vitamins/StockMetal.scad", "Stock Metal", "StockMetal()") {
        view(t=[6.9, 13.6, 10.3], r=[72,0,33], d=280);

        if (DebugCoordinateFrames) frame();
        if (DebugConnectors) {
            connector(StockMetal_Con_Def);
        }

        // parts
        StockMetal_Body();
    }
}

module StockMetal_Body() {
    part("StockMetal_Body", "StockMetal_Body()");

    color(Blue, 0.8)
        if (UseVitaminSTL) {
            import(str(VitaminSTL,"StockMetal_Body.stl"));
        }
        else
        {
            // body
            cube([10,10,10]);

        }
}
