@name Advanced Missile Expression

@inputs Target:entity

@outputs Det Hold Vec:vector Mult
#@outputs HoloTest:vector, TP:vector

@persist GPS:vector
@persist Dist Tvel Gvel
@persist LM IM LV:vector GV:vector
 
interval(75)
 
LM = 0.00000075      #Lead Angle Modifier
IM = 0.00005         #Inertia Correction Modifier
 
 if(Target)
   {
    Hold = 1
 
    GPS = entity():pos()
    Dist = Target:massCenter():distance(GPS)
 
    if (Dist < 100) {Det = 1}
 
    Tvel = Target:vel():length() * LM
    Gvel = entity():vel():length() * IM
    LV = (Target:vel() * Tvel) * Dist
    GV = entity():vel() * Gvel
    Vec = GPS -(Target:massCenter() + LV - GV)
 
    #TP = Target:massCenter()
    #HoloTest = vec(-((TP:x()+LV:x())-GV:x()), (TP:y()+LV:y())-GV:y(), ((TP:z()+LV:z())-GV:z())-150)
 
    Mult = 1
   }
else{Mult = 0, Hold = 0}
