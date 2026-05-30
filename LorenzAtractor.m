% Parámetros del sistema de Lorenz
sigma = 10;
rho1 = input('Ingrese rho1: ');   % Primer valor de rho
rho2 = input('Ingrese rho2: ');  % Segundo valor de rho
beta = 8/3;

% Condiciones iniciales y tiempo
x0 = input('Condicion inicial x0: ')
p0 = input('Condicion inicial x1: ')
%x0 = [2; 3; 0];
%p0 = [1,1,1];
tiempo = linspace(0, 50, 10000);

% Función del sistema
function dxdt = atractor_lorenz(t, x, sigma, rho, beta)
    dxdt = [sigma * (x(2) - x(1));     % dx/dt
            x(1) * (rho - x(3)) - x(2); % dy/dt
            x(1) * x(2) - beta * x(3)]; % dz/dt
end

% Resolver ambos sistemas
[t1, xyz1] = ode45(@(t, x) atractor_lorenz(t, x, sigma, rho1, beta), tiempo, x0);
[t2, xyz2] = ode45(@(t, x) atractor_lorenz(t, x, sigma, rho2, beta), tiempo, p0);

x1 = xyz1(:, 1); y1 = xyz1(:, 2); z1 = xyz1(:, 3);
x2 = xyz2(:, 1); y2 = xyz2(:, 2); z2 = xyz2(:, 3);

%Figura
figure;
set(gcf, 'Position', [100, 100, 800, 600]);
hold on;
view(3);
xlabel('x'); ylabel('y'); zlabel('z');
title('Comparación de Atractores de Lorenz (ρ=28 vs ρ=100)');
grid on;

% Inicializar gráficos para ambos sistemas
linea1 = plot3(x1(1), y1(1), z1(1), 'm-', 'LineWidth', 1.5); % Sistema 1
punto_guia1 = plot3(x1(1), y1(1), z1(1), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);

linea2 = plot3(x2(1), y2(1), z2(1), 'g-', 'LineWidth', 1.5); % Sistema 2
punto_guia2 = plot3(x2(1), y2(1), z2(1), 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 8);

%puntos fijos
raiz1 = sqrt(beta * (rho1 - 1))
raiz2 = sqrt(beta * (rho2 - 1))

rho_imaginario = (sigma*(sigma + beta + 3))/(sigma - beta -1)


scatter3(raiz1,raiz1,rho1-1, 50, 'filled', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k');
text(raiz1, raiz1, rho1-1, '      Punto fijo 1 rho1', 'FontSize', 10, 'Color', 'k');
scatter3(-raiz1,-raiz1,rho1-1, 50, 'filled', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k');
text(-raiz1, -raiz1, rho1-1, '      Punto fijo 2 rho1', 'FontSize', 10, 'Color', 'k');

scatter3(raiz2,raiz2,rho2-1, 50, 'filled', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k');
text(raiz2, raiz2, rho2-1, '      Punto fijo 1 rho2', 'FontSize', 10, 'Color', 'k');
scatter3(-raiz2,-raiz2,rho2-1, 50, 'filled', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k');
text(-raiz2, -raiz2, rho2-1, '      Punto fijo 2 rho2', 'FontSize', 10, 'Color', 'k');;

% Ajustar ejes
margin = 5;
xlim([min([x1; x2])-margin, max([x1; x2])+margin]);
ylim([min([y1; y2])-margin, max([y1; y2])+margin]);
zlim([min([z1; z2]), max([z1; z2])+margin]);

legend(num2str(rho1), '', num2str(rho2), '');

% Animación
for k = 1:5:length(tiempo)
    % Actualizar sistema 1
    set(linea1, 'XData', x1(1:k), 'YData', y1(1:k), 'ZData', z1(1:k));
    set(punto_guia1, 'XData', x1(k), 'YData', y1(k), 'ZData', z1(k));

    % Actualizar sistema 2
    set(linea2, 'XData', x2(1:k), 'YData', y2(1:k), 'ZData', z2(1:k));
    set(punto_guia2, 'XData', x2(k), 'YData', y2(k), 'ZData', z2(k));

    drawnow;
    pause(0.05);
end
