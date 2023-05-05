% DATASTATISTICS Calculate and display statistics
%
% Usage: result = dataStatistics(data, statistic)
% 
% Author: Ekaterina Wyss Storm, s163627
%
% Co-authors: Erlend André Hall, s202055
%             Johnnie Hundrup, s203983
%             

function result = dataStatistics(data, statistic)

ActiveFilter = cell2mat(struct2cell(load('ActivatedFilters.mat')));
noFilters = [10 60 0 1;0 0 0 0];
filterText = '';
filterText1 = '';
filterText2 = '';
filterText3 = '';
filterText4 = '';
filterText5 = '';

if ActiveFilter(:,:) == noFilters(:,:)
    filterText = 'No data filter is applied.';
end
if ActiveFilter(1,1) ~= noFilters(1,1)
    filterText1 = 'Active filter - Minimum Temperature set.';
end
if ActiveFilter(1,2) ~= noFilters(1,2)
    filterText2 = 'Active filter - Maximum Temperature set.';
end
if ActiveFilter(1,3) ~= noFilters(1,3)
    filterText3 = 'Active filter - Minimum Growth rate set.';
end
if ActiveFilter(1,4) ~= noFilters(1,4)
    filterText4 = 'Active filter - Maximum Growth rate set.';
end
if ActiveFilter(2,:) ~= noFilters(2,:)
    filterText5 = 'Active filter - One or more bacteria types has been chosen.';
end

switch statistic %case insensitive 
    
    case 'Mean Temperature'
        result = mean(data(:,1));
        waitfor(warndlg({sprintf('Mean Temperature is %g degrees.', result);'';filterText;filterText1;filterText2;filterText3;filterText4;filterText5}, 'Mean Temperature'));
        clc
        
    case 'Mean Growth rate'
        result = mean(data(:,2));
        waitfor(warndlg({sprintf('Mean Growth rate is %g.', result);'';filterText;filterText1;filterText2;filterText3;filterText4;filterText5}, 'Mean Growth rate'));
        clc

    case 'Std Temperature'
        result = std(data(:,1));
        waitfor(warndlg({sprintf('Std Temperature is %g degrees.', result);'';filterText;filterText1;filterText2;filterText3;filterText4;filterText5}, 'Std Temperature'));
        clc

    case 'Std Growth rate'
        result = std(data(:,2));
        waitfor(warndlg({sprintf('Std Growth rate is %g.', result);'';filterText;filterText1;filterText2;filterText3;filterText4;filterText5}, 'Std Growth rate'));
        clc
        
    case 'Rows'
        result = size(data, 1);
        waitfor(warndlg({sprintf('The selected data consists of %g rows.', result);'';filterText;filterText1;filterText2;filterText3;filterText4;filterText5}, 'Number of Rows'));
        clc
        
    case 'Mean Cold Growth rate'
        result = mean(data(data(:,1) < 20, 2));
        waitfor(warndlg({sprintf('Mean Cold Growth rate is %g.', result);'';filterText;filterText1;filterText2;filterText3;filterText4;filterText5}, 'Mean Cold Growth rate'));
        clc
        
    case 'Mean Hot Growth rate'
        result = mean(data(data(:,1) > 50, 2));
        %msgbox(['Mean Hot Growth rate is ' num2str(result)]);
        waitfor(warndlg({sprintf('Mean Hot Growth rate is %g.', result);'';filterText;filterText1;filterText2;filterText3;filterText4;filterText5}, 'Mean Hot Growth rate'));
        clc
end
end










    
  



 





