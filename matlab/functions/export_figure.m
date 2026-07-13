function export_figure(fig, filename)
%EXPORT_FIGURE Export a white-background PNG suitable for documentation.

    folder = fileparts(filename);
    if ~isempty(folder) && ~exist(folder, 'dir')
        mkdir(folder);
    end
    set(fig, 'Color', 'w');
    set(fig, 'PaperPositionMode', 'auto');
    print(fig, filename, '-dpng', '-r180');
end
