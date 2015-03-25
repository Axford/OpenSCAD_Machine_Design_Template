/*
    Cutpart: ${description}

    Local Frame:
*/


// Connectors

${name}_Con_Def				= [ [0,0,0], [0,0,-1], 0, 0, 0];



module ${name}(complete=false) {

    a_variable = 10;

    if (DebugCoordinateFrames) frame();
    if (DebugConnectors) {
        connector(${name}_Con_Def);
    }

    cutPart(
        "cutparts/{$name}.scad",
        "{$description}",
        "{$name}()",
        "{$name}(true)",
        1,   // how many steps
        complete  // show as complete?  i.e. last step!
        ) {

        view(t=[6.9, 13.6, 10.3], r=[72,0,33], d=280);

        // Step one - first cut!
        step(1, str("Cut some material to ", a_variable,"mm long")) {
            view(t=vt, r=vr);

            // the result of the cut is:
            cube([10, a_variable, 10]);
        }

        // Put further processing steps below, e.g. more cuts, drilling holes
        // step(2, ...)

    }
}
