/*
    Vitamin: DC Motor

    Local Frame:
        Motor centred on XY origin
        Shaft points up (Z+)
        Mounting face of motor is at Z=0 (boss will extend along Z+)

*/


// Global parameters



// Types
// -----

/*
    Model is parameterised in several parts:
       FrontShaft
       FrontBoss - protrudes from the face of the motor
       FrontCan - gearbox, reduced diameter for mounting, etc - may be zero
       FrontFixings

       RearCan - main motor region
       RearBoss - protrudes from the rear of the motor
       RearShaft
       RearFixings
*/

// Type getters
function DCMotor_TypeSuffix(t)         = t[0];
function DCMotor_FrontCan_OD(t)        = t[1];
function DCMotor_FrontCan_Length(t)    = t[2];
function DCMotor_RearCan_OD(t)         = t[3];
function DCMotor_RearCan_Length(t)     = t[4];
function DCMotor_FrontShaft_OD(t)      = t[5];
function DCMotor_FrontShaft_Length(t)  = t[6];
function DCMotor_FrontBoss_OD(t)       = t[7];
function DCMotor_FrontBoss_Length(t)   = t[8];


// Type table
//                      Type suffix, FC_OD, FC_L, RC_OD, RC_L, FS_OD, FS_L, FB_OD, FB_L
DCMotor_R260        = ["R260",       19,    3.5,  23.8,  23.5, 2,     8.5,  6,     1.6  ];
DCMotor_CL072014    = ["CL072014",   0,     0,    7,     20,   1,     5,    2,     0.5 ];

// Type Collection
DCMotor_Types = [
    DCMotor_R260,
    DCMotor_CL072014
];

// Vitamin Catalogue
module DCMotor_Catalogue() {
    for (t = DCMotor_Types) DCMotor(t);
}



// Connectors

// Face connector - use for attach the motor face to a bracket
DCMotor_Con_Face				= [ [0,0,0], [0,0,1], 0, 0, 0];

// Shaft connector - use for attaching parts to the end of the shaft
// Conditional on motor type
function DCMotor_Con_Shaft(t)	= [ [0,0, DCMotor_FrontShaft_Length(t)], [0,0,-1], 0, 0, 0];



module DCMotor(type=DCMotor_R260) {

    ts = DCMotor_TypeSuffix(type);

    vitamin("vitamins/DCMotor.scad", str(ts," DC Motor"), str("DCMotor(DCMotor_",ts,")")) {
        view(t=[6.9, 13.6, 10.3], r=[72,0,33], d=280);

        if (DebugCoordinateFrames) frame();
        if (DebugConnectors) {
            connector(DCMotor_Con_Face);
            connector(DCMotor_Con_Shaft(type));
        }

        DCMotor_Model(type);
    }
}

module DCMotor_Model(t) {
    fcod = DCMotor_FrontCan_OD(t);
    fcl = DCMotor_FrontCan_Length(t);
    rcod = DCMotor_RearCan_OD(t);
    rcl = DCMotor_RearCan_Length(t);
    fsod = DCMotor_FrontShaft_OD(t);
    fsl = DCMotor_FrontShaft_Length(t);
    fbod = DCMotor_FrontBoss_OD(t);
    fbl = DCMotor_FrontBoss_Length(t);

    // Front shaft
    color(MetalColor)
        cylinder(r=fsod/2, h=fsl);

    // Front boss
    color(MetalColor)
        cylinder(r=fbod/2, h=fbl);

    // Front can
    color(Grey50)
        translate([0,0,-fcl])
        cylinder(r=fcod/2, h=fcl);

    // Rear can
    color(MetalColor)
        translate([0,0,-rcl-fcl])
        cylinder(r=rcod/2, h=rcl);
}
