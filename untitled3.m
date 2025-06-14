function drawDARTNavArchitecture()
    % Initialize figure
    fig = figure('Color', 'k', 'Position', [100 100 1400 800]);
    axis off; hold on;
    
    % Define NASA-style blocks
    blocks = {
        [0.1 0.6 0.2 0.3], 'Sensors', {'DRACO Camera', 'Star Trackers', 'IMU'}, [0.9 0.2 0.2];
        [0.4 0.6 0.2 0.3], 'Data Processing', {'SMART Nav Algorithms', 'Kalman Filter'}, [0.2 0.7 0.2];
        [0.7 0.6 0.2 0.3], 'GNC System', {'Trajectory Optimization', 'Collision Mapping'}, [0.2 0.2 0.9];
        [0.4 0.1 0.2 0.3], 'Actuation', {'Hydrazine Thrusters', 'Reaction Wheels'}, [0.7 0.4 0.2];
    };
    
    % Draw blocks
    for i = 1:size(blocks,1)
        pos = blocks{i,1};
        color = blocks{i,4};
        % Block
        rectangle('Position', pos, 'FaceColor', color, 'EdgeColor', 'w', 'LineWidth', 2);
        % Title
        text(pos(1)+0.02, pos(2)+pos(4)*0.85, blocks{i,2}, ...
            'Color', 'w', 'FontSize', 12, 'FontWeight', 'bold');
        % Components
        for j = 1:length(blocks{i,3})
            text(pos(1)+0.05, pos(2)+pos(4)*(0.7 - 0.15*(j-1)), ...
                blocks{i,3}{j}, 'Color', 'w', 'FontSize', 10);
        end
    end
    
    % Draw data flow
    annotation('arrow', [0.3 0.4], [0.75 0.75], 'Color', 'y', 'LineWidth', 1.5);
    annotation('arrow', [0.6 0.7], [0.75 0.75], 'Color', 'y', 'LineWidth', 1.5);
    annotation('arrow', [0.7 0.7], [0.6 0.4], 'Color', 'y', 'LineWidth', 1.5);
    annotation('arrow', [0.5 0.5], [0.4 0.25], 'Color', 'y', 'LineWidth', 1.5);
    
    % Labels
    text(0.25, 0.78, 'Raw Sensor Data', 'Color', 'y', 'FontSize', 10);
    text(0.55, 0.78, 'Processed State', 'Color', 'y', 'FontSize', 10);
    text(0.72, 0.5, 'Guidance Commands', 'Color', 'y', 'FontSize', 10);
    text(0.48, 0.33, 'Actuation Signals', 'Color', 'y', 'FontSize', 10);
    
    % Title
    title('DART Autonomous Navigation (Final Approach)', 'Color', 'w', 'FontSize', 16);
end