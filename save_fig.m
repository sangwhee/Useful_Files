function save_fig(fig, filename, fileformat, w_inches, h_inches)
% suggests to use 3 inches for the width and 2-2.5 for the height
% save_fig(gcf, filename.png', 3, 2)
% w_inches = 3.4, h_inch = 1.6 works good for MS word, 1 colum
%Or try "eps" type for rendering in LateX
plotSize = [0 0 w_inches h_inches]; % [~ ~ width height] in inches

% This helps with proper rendering I think...?
set(fig,'renderer','Painters');

% This configures the paper print sizing
set(fig,'PaperPositionMode','manual','PaperUnits','inches', 'PaperPosition', plotSize);  

% This sets the screen dimensions to match the printed size so we can check
myDPI = get(groot,'ScreenPixelsPerInch');
set(fig,'Position', plotSize .* myDPI);  
movegui(fig, 'center');

    if ( strcmp('svg',fileformat) == 1)
        print(fig, sprintf("-d%s", fileformat), '-noui', filename, '-r300');
    else
        exportgraphics(fig,[filename,'.',fileformat],'Resolution',300); % JPEG, PNG, TIFF, PDF,EMF,EPS available.
    end
%

end