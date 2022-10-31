% Principal Moments of Inertia
Irot = [150, 0, -100; 0, 250, 0; -100, 0, 500];
[PrincipalDirections, PrincipalMoments] = eig(Irot)
TraceIrot = trace(Irot)
TracePM = trace(PrincipalMoments)