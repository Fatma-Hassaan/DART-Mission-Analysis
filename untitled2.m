% ====== Setup Orbits ======
% Initialize structures
earth = struct();
didymos = struct();

% Earth's orbital elements (J2000)
earth.a = 1.000373 * 149.6e6;  % Semi-major axis (km)
earth.e = 0.0167;              % Eccentricity
earth.i = 0;                   % Inclination (deg)
earth.Omega = 0;               % RAAN (deg)
earth.omega = 288.1;           % Argument of periapsis (deg)
earth.M0 = 356.0;              % Mean anomaly (deg)

% Didymos' orbital elements (J2000)
didymos.a = 1.644 * 149.6e6;   % Semi-major axis (km)
didymos.e = 0.384;             % Eccentricity
didymos.i = 3.41;              % Inclination (deg)
didymos.Omega = 73.27;         % RAAN (deg)
didymos.omega = 319.03;        % Argument of periapsis (deg)
didymos.M0 = 0;                % Mean anomaly (deg)

% Manually define orbits as structures
earthOrbit = struct('a', earth.a, 'e', earth.e, 'i', earth.i, ...
                    'Omega', earth.Omega, 'omega', earth.omega, 'M0', earth.M0);
didymosOrbit = struct('a', didymos.a, 'e', didymos.e, 'i', didymos.i, ...
                      'Omega', didymos.Omega, 'omega', didymos.omega, 'M0', didymos.M0);