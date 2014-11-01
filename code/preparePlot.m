function text = preparePlot(texts)
% prepares plot, where text are all labels and stuff;

%in case latex formating is needed
set(0,'defaulttextinterpreter','latex')

% the following code makes the plot look nice and increase font size etc.
set(gca,'fontsize',20,'fontname','Times','box','off','tickdir','out','ticklength',[.02 .02],'xcolor',0.5*[1 1 1],'ycolor',0.5*[1 1 1]);

set(texts,'fontsize',18,'fontname','Times','color',0.1*[1 1 1]);

%for boxplots
set(findobj(gca,'Type','text'),'FontSize',10,'fontname','Times','color',0.3*[1,1,1]);
grid on;

end

%then should be: 
%print -dpdf name_of_file.pdf