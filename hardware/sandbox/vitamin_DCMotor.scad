include <../config/config.scad>
include <../vitamins/DCMotor.scad>
UseSTL=false;
UseVitaminSTL=false;
DebugConnectors=true;
DebugCoordinateFrames=true;
DCMotor();

translate([0,20,0])
    DCMotor(DCMotor_CL072014);
