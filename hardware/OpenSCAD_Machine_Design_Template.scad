include <config/config.scad>

STLPath = "printedparts/stl/";
VitaminSTL = "vitamins/stl/";

DebugCoordinateFrames = 0;
DebugConnectors = false;

UseSTL = true;

machine("OpenSCAD_Machine_Design_Template.scad","OpenSCAD_Machine_Design_Template") {

    view(size=[1024,768], t=[68, 49, -37], r=[73, 0, 229], d=1951);


    //Top level assembly
    //Assembly();

    // dummy cube - just so you can see something!
    cube([10,10,10]);

    // NB: use utility script to create new assemblies:
    //     hardware/ci/adda.py assembly <assembly name> <assembly description>
}
