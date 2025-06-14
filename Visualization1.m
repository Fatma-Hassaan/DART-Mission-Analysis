% Parameters
G = 6.674e-20;          % Gravitational constant (km³/kg/s²)
m1 = 5.228e11;          % Didymos mass (kg)
m2 = 4.842e9;           % Dimorphos mass (kg)
r0 = 1.19;              % Initial orbital radius (km)
v0 = 0.17275;           % Initial tangential velocity (km/s)
deltaV = linspace(0, 0.02, 100);  % ΔV (km/s)

% Calculate orbital periods
T = 2*pi * sqrt(((G*(m1 + m2)) ./ ((v0 - deltaV).^2 * r0).^3 / (G*(m1 + m2)))) / 3600;

% Create gradient color based on ΔV
colors = linspace(0.8, 0.1, length(deltaV));
cmap = [linspace(0, 1, 100)', linspace(0.2, 0, 100)', linspace(1, 0, 100)']; % Blue to red

% Plot
figure;
set(gcf, 'Color', 'k'); % Black background
ax = gca;
ax.Color = 'k';
ax.XColor = 'w';
ax.YColor = 'w';
ax.GridColor = [0.5 0.5 0.5];
hold on;

% Gradient line with markers
scatter(deltaV*1000, T, 40, cmap, 'filled', 'MarkerEdgeColor', 'w');
plot(deltaV*1000, T, 'w--', 'LineWidth', 1, 'Alpha', 0.3);

% Highlight DART's actual ΔV = 2.2 mm/s
[~, idx] = min(abs(deltaV*1000 - 2.2));
scatter(deltaV(idx)*1000, T(idx), 150, 'y', 'pentagram', 'LineWidth', 2);
text(deltaV(idx)*1000 + 0.1, T(idx), ...
    sprintf('DART Impact: ΔV = %.1f mm/s\nΔT = 33 min', 2.2), ...
    'Color', 'y', 'FontSize', 10, 'VerticalAlignment', 'bottom');

% Labels
xlabel('Velocity Perturbation, ΔV (m/s)', 'Color', 'w', 'FontSize', 12);
ylabel('Orbital Period, T (hours)', 'Color', 'w', 'FontSize', 12);
title('Orbital Period Reduction vs. ΔV (NASA DART Mission)', ...
    'Color', 'w', 'FontSize', 14, 'FontWeight', 'bold');
grid on;

% Add mission patch
annotation('rectangle', [0.8, 0.8, 0.1, 0.1], 'Color', 'none', ...
    'FaceColor', 'none', 'LineWidth', 1);
text(0.85, 0.82, 'NASA', 'Color', 'r', 'FontSize', 14, 'FontWeight', 'bold');
text(0.83, 0.78, 'DART', 'Color', 'w', 'FontSize', 12);
