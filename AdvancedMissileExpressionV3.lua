@name Advanced Missile Expression

@inputs Target:entity

@outputs Det Hold Vec:vector Mult VC:vector
#@outputs HoloTest:vector TP:vector

@persist GPS:vector
@persist Dist Tvel Gvel
@persist LM IM LV:vector GV:vector
@persist A VC1:vector VelChan:vector AM

interval(75)

LM = 0.00000075   #Lead Angle Modifier
IM = 0.00005000   #Inertia Correction Modifier
AM = 0.00000010   #Acceleration Correction Modifier

if(Target)
  {   
   Hold = 1
   
   GPS = entity():pos()
   Dist = Target:massCenter():distance(GPS)
   if (Dist < 100) {Det = 1}   
   
   A += 1
   if (A > 2) {A = 0}
   if (A == 1) {VC1 = Target:vel()}
   if (A == 2) {VelChan = Target:vel() - VC1}
   
   Tvel = Target:vel():length() * LM
   Gvel = entity():vel():length() * IM
   LV = ((Target:vel() * Tvel) + (VelChan * AM)) * Dist
   GV = entity():vel() * Gvel
   Vec = GPS -(Target:massCenter() + LV - GV)
   
   VC = VelChan * AM
   
   #TP = Target:massCenter()
   #HoloTest = Vec(-((TP:x()+LV:x())-GV:x()), (TP:y()+LV:y())-GV:y(), ((TP:z()+LV:z())-GV:z())-150)
   
   Mult = 1
  }
else{Mult = 0, Hold = 0}
