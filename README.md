# Advanced Lead-Collision Missile Guidance Expression

![Lead-collision](https://github.com/TimIsabella/Gmod-AdvancedMissileExpression/blob/main/Lead-Collision.jpg)

Targeting in its basic form can be considered a straight line trajectory from a 
starting point to target (vector) -- this is known as 'line of sight' targeting.
When it comes to moving targets, it is required to lead that target so as
to intercept it at a future point in space ahead of where it is initially
-- this is known as 'lead-collision' targeting.

[HERE](https://www.youtube.com/watch?v=T2fPKUfmnKo) is a good 2D demonstration of this concept.

## Lead-Collision Calculation

By utilizing live target vector and velocity data, a trajectory leading a target can 
be calculated in real-time, effectively plotting a straight line to a moving target 
and cutting all corners where possible. By also calculating the inertia of the projectile,
interception accuracy and guidance reaction time are greatly enhanced while also eliminating
target orbit which is exhibited with line of sight guidance due to unmitigated inertia.

## Video Demonstration
[![Watch the video](https://github.com/TimIsabella/Gmod-AdvancedMissileExpression/blob/main/AME.png)](https://www.youtube.com/watch?v=8GuJDiRmCqA)
