@name Advanced Missile Expression

@inputs Target:entity

@outputs Det Hold Vec:vector Mult
#@outputs HoloTest:vector

@persist GPS:vector
@persist LM IM Dist Tvel Gvel
@persist Tx Ty Tz
@persist Lx Ly Lz
@persist Gx Gy Gz

interval(75)

LM = 0.00000075       #Lead Angle Modifier
IM = 0.00005          #Inertia Correction Modifier

if(Target)
  {   
   Hold = 1
   Mult = 1
   
   GPS = entity():pos()
   Dist = Target:pos():distance(GPS)
   
   if (Dist < 100) {Det = 1}
   
   Tx = Target:pos():x()
   Ty = Target:pos():y()
   Tz = Target:pos():z()

   Tvel = Target:vel():length() * LM
   Gvel = entity():vel():length() * IM

   Lx = (Target:vel():x() * (Tvel)) * Dist
   Ly = (Target:vel():y() * (Tvel)) * Dist
   Lz = (Target:vel():z() * (Tvel)) * Dist
   Gx = entity():vel():x() * Gvel
   Gy = entity():vel():y() * Gvel
   Gz = entity():vel():z() * Gvel
   
   Vec = GPS - vec((Tx+Lx)-Gx, (Ty+Ly)-Gy, (Tz+Lz)-Gz)

   #HoloTest = vec(-((Tx+Lx)-Gx), (Ty+Ly)-Gy, ((Tz+Lz)-Gz)-150)
  }
else {Mult = 0, Hold = 0}
