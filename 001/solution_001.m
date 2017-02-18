#! /usr/bin/env MathematicaScript -script

projectEuler001[upto_] := Module[
    { numbers
    , multiples
    , solution
    },
    numbers   = Range[0, upto - 1];
    multiples = Select[numbers, Mod[#, 3] == 0 || Mod[#, 5] == 0 &];
    solution  = Total[multiples];
    Print[solution];
];

projectEuler001[1000]
