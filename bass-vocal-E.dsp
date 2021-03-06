import ("stdfaust.lib");
fcut = vslider("freq  CUt [style:knob][scale:exp]", 880, 20, 10000, 1);
order = 32;
f1 = no.noise : fi.highpass(order,fcut): fi.lowpass(order,fcut);
f2 = no.noise : fi.highpass(order,fcut*2): fi.lowpass(order,fcut*2);
Ebassf1 = no.noise : fi.highpass(128,600): fi.lowpass(128,600);
Ebassf2 = no.noise : fi.highpass(128,1040): fi.lowpass(128,1040);
Ebassf3 = no.noise : fi.highpass(order,2250): fi.lowpass(order,2250);
Ebassf4 = no.noise : fi.highpass(order,2450): fi.lowpass(order,2450);
Ebassf5 = no.noise : fi.highpass(order,2750): fi.lowpass(order,2750);

process =  (Ebassf1*(0.10)) + (Ebassf2*(0.05)); //+ (Ebassf3*(0.25)) + (Ebassf4*(0.2)) + (Ebassf5*(0.03));
 
 // vocale E voce di basso
 // f1 f2 f3 f4 f5 
 // 600 1040 2250 2450 2750 (frequenze)
 // 60 70 110 120 130 (larghezza di banda Hz)
 // 0 -7 -9 -9 -20 (decibel)
 // a casa: far suonare la vocale E con questi parametri

//ingain = hslider("[00] INPUT GAIN", 0, -70, +12, 0.1) : ba.db2linear : si.smoo;
//envelop = abs : max ~ -(1.0/ma.SR) : max(ba.db2linear(-70)) : ba.linear2db;
//inmeter(x) = attach(x, envelop(x) : hbargraph("[01] IN [unit:dB]", -70, +5));
