function [leghandle,labelhandles]=legend(varargin)
% MYLEGEND Graph legend.
%
% Modified from LEGEND to receive color specifications in the form:
%    mylegend([handle1; handle2],{'Label1' 'Label2'},{'r' 'k'})
%
%   LEGEND(string1,string2,string3, ...) puts a legend on the current plot
%   using the specified strings as labels. LEGEND works on line graphs,
%   bar graphs, pie graphs, ribbon plots, etc.  You can label any
%   solid-colored patch or surface object.  The fontsize and fontname for
%   the legend strings matches the axes fontsize and fontname.
%
%   LEGEND(H,string1,string2,string3, ...) puts a legend on the plot
%   containing the handles in the vector H using the specified strings as
%   labels for the corresponding handles.
%
%   LEGEND(M), where M is a string matrix or cell array of strings, and
%   LEGEND(H,M) where H is a vector of handles to lines and patches also
%   works.
%
%   LEGEND(AX,...) puts a legend on the axes with handle AX.
%
%   LEGEND OFF removes the legend from the current axes.
%   LEGEND(AX,'off') removes the legend from the axis AX.
%
%   LEGH = LEGEND returns the handle to legend on the current axes or
%   empty if none exists.
%
%   LEGEND with no arguments refreshes all the legends in the current
%   figure (if any).  LEGEND(LEGH) refreshes the specified legend.
%
%   LEGEND(...,Pos) places the legend in the specified
%   location:
%       0 = Automatic "best" placement (least conflict with data)
%       1 = Upper right-hand corner (default)
%       2 = Upper left-hand corner
%       3 = Lower left-hand corner
%       4 = Lower right-hand corner
%      -1 = To the right of the plot
%
%   To move the legend, press the left mouse button on the legend and drag
%   to the desired location. Double clicking on a label allows you to edit
%   the label.
%
%   [LEGH,OBJH] = LEGEND(...) returns a handle LEGH to the legend axes and
%   vector OBJH containing the text, line, and patch handles.
%
%	 LEGEND(h,{labels},{colorstrings}) will use colorstrings for the labels
%	 LEGEND({labels},{colorstrings}) will use colorstrings for the labels
%
%   LEGEND will try to install a ResizeFcn on the figure if it hasn't been
%   defined before.  This resize function will try to keep the legend the
%   same size.
%
%
%   Examples:
%       x = 0:.2:12;
%       plot(x,bessel(1,x),x,bessel(2,x),x,bessel(3,x));
%       legend('First','Second','Third');
%       legend('First','Second','Third',-1)
%
%       b = bar(rand(10,5),'stacked'); colormap(summer); hold on
%       x = plot(1:10,5*rand(10,1),'marker','square','markersize',12,...
%                'markeredgecolor','y','markerfacecolor',[.6 0 .6],...
%                'linestyle','-','color','r','linewidth',2); hold off
%       legend([b,x],'Carrots','Peas','Peppers','Green Beans',...
%                 'Cucumbers','Eggplant')       
%
%   See also PLOT.

%   D. Thomas 5/6/93
%             9/6/95  
%   Rich Radke 6/17/96 Latest Update
%   Copyright (c) 1984-98 by The MathWorks, Inc.
%   $Revision: 5.53 $  $Date: 1998/12/10 22:07:24 $

%   Private syntax:
%
%     LEGEND('DeleteLegend') is called from the deleteFcn to remove the legend.
%     LEGEND('EditLegend',h) is called from MOVEAXIS to edit the legend labels.
%     LEGEND('ShowLegendPlot') is called from MOVEAXIS to set the gco to
%     the plot the legend goes with.
%     LEGEND('ResizeLegend') is called from the resizeFcn to resize the legend.
%
%   Obsolete syntax:
%
%     LEGEND(linetype1,string1,linetype2,string2, ...) specifies
%     the line types/colors for each label.
%     Linetypes can be any valid PLOT linetype specifying color,
%     marker type, and linestyle, such as 'g:o'.  

narg = nargin;
isresize(0);

%--------------------------
% Parse inputs
%--------------------------

% Determine the legend parent axes (ha) is specified
if narg > 0 & ~isempty(varargin{1}) & ishandle(varargin{1}) & ...
	strcmp(get(varargin{1}(1),'type'),'axes') % legend(ax,...)
    ha = varargin{1}(1);
    varargin(1) = []; % Remove from list
    narg = narg - 1;
    if strcmp(get(ha,'Tag'),'legend') % Use the parent
      ud = get(ha,'userdata');
      if isfield(ud,'PlotHandle')
         ha = ud.PlotHandle;
      else
        warning('Can''t put a legend on a legend.')
        if nargout>0, leghandle = []; labelhandles = []; end
        return
      end
    end
else
  ha = [];
end

if narg==0 % legend
  if nargout==1, % h = legend
    if isempty(ha)
      leghandle = find_legend(find_gca);
    else
      leghandle = find_legend(ha);
    end
  elseif nargout==0 % legend
    if isempty(ha)
      update_all_legends(COL,linetypeinput)
    else
      update_legend(find_legend(ha));
    end
  else % [h,objh] = legend
    if isempty(ha)
      [leghandle,labelhandles] = find_legend(find_gca);
    else
      [leghandle,labelhandles] = find_legend(ha);
    end
  end
  return
elseif narg==1 & strcmp(varargin{1},'DeleteLegend'), % legend('DeleteLegend')
  % Should only be called by the deleteFcn
  delete_legend(gcbo)
  if nargout>0, error('Too many outputs.'); end
  return
elseif narg==1 & strcmp(varargin{1},'ResizeLegend'), % legend('ResizeLegend')
  isresize(1);
  resize_all_legends(gcbf,COL)
  isresize(0);
  if nargout>0, error('Too many outputs.'); end
  return
elseif narg==1 & strcmp(varargin{1},'off'), % legend('off') or legend(AX,'off')
  if isempty(ha)
    delete_legend(find_legend(find_gca))
  else
    delete_legend(find_legend(ha))
  end   
  if nargout>0, error('Too many outputs.'); end
  return
elseif narg==1 & strcmp(varargin{1},'ShowLegendPlot')
  show_plot
  return
elseif narg==2 & strcmp(varargin{1},'EditLegend')
  edit_legend(varargin{2})
  return
elseif narg==1 & islegend(varargin{1}) % legend(legh)
  [hl,labelhandles] = update_legend(varargin{1});
  if nargout>0, leghandle = hl; end
  return
elseif narg>=3,
   COL = varargin{3};
   if narg>=4,
       linetypeinput = varargin{4};
   end
end

% Look for legendpos code
if isa(varargin{end},'double')
  legendpos = varargin{end};
  varargin(end) = [];
else
  legendpos = [];
end

% Determine the active children (kids) and the strings (lstrings)
if narg < 1
  error('Not enough input arguments.');
elseif ishandle(varargin{1}) % legend(h,strings,...)
  kids = varargin{1};
  if isempty(ha)
    ha=get(varargin{1}(1),'Parent');
    if ~strcmp(get(ha,'type'),'axes'),
      error('Handle must be an axes or child of an axes.');
    end
  end
  if narg==1, error('A string must be supplied for each handle.'); end
  [lstrings,COL] = getstrings(varargin(2:end));
else % legend(strings,...) or legend(linetype,string,...)
  if isempty(ha), ha=find_gca; end
  kids = getchildren(ha);
  [lstrings ,COL]=getstrings(varargin);
end

% Set default legendpos
if isempty(legendpos)
  if ~isequal(get(ha,'view'),[0 90])
    legendpos = -1;  % To the right of axis is default for 3-D
  else
    legendpos = 1;   % Upper right is default for 2-D
  end
end

% Remove any existing legend on this plot 
hl = find_legend;
if ~isempty(hl),
  ud = get(hl,{'userdata'});
  for i=1:length(ud)
    if isfield(ud{i},'PlotHandle') & ud{i}.PlotHandle == ha
      delete_legend(hl)
    end
  end
end

if length(kids)==0,
  warning('Plot empty.')
  if nargout>0
    leghandle = []; labelhandles = [];
  end
  return
end

[hl,labelhandles] = make_legend(ha,kids,lstrings,legendpos,[],COL,linetypeinput);

if nargout > 0,
    leghandle=hl;
end


%--------------------------------
function [hl,hobjs] = find_legend(ha)
%FIND_LEGEND Return current legend handle or error out if none.
if nargin==0
  hl = findobj(allchild(find_gcf),'Tag','legend');
else
  hl = findobj(allchild(find_gcf(ha)),'Tag','legend');
end
hobjs = [];
if nargin>0
  if length(ha)~=1
    error('Requires a single axis handle.');
  end
  ud = get(hl,{'userdata'});
  for i=1:length(ud)
    if isfield(ud{i},'PlotHandle') & ud{i}.PlotHandle == ha
      hl = hl(i);
      hobjs = ud{i}.LabelHandles;
      return
    end
  end
  hl = []; % None found
  hobjs = [];
end

%-------------------------------
function tf = isresize(setting)
persistent s
if nargin==1
  s = setting;
else
  tf = s;
end

%--------------------------------
function hf = find_gcf(ha)
%FIND_GCF Find gcf.
%   FIND_GCF Returns the callback figure if there is one otherwise
%   it returns the current figure.
if nargin==1 & strcmp(get(ha,'type'),'axes')
  hf = get(ha,'parent');
else
  if isresize
    hf = gcbf;
    if isempty(hf),
      hf = gcf;
    end
  else
    hf = gcf;
  end 
end

%---------------------------------
function ha = find_gca(ha)
%FIND_GCA Find gca (skipping legend)
if nargin==0
fig = find_gcf;
else
fig = find_gcf(ha);
end
ha = get(fig,'currentaxes');
if isempty(ha), ha = gca; end
if strcmp(get(ha,'tag'),'legend')
  ud = get(ha,'userdata');
  if isfield(ud,'PlotHandle')
    ha = ud.PlotHandle;
    % Make sure legend isn't isn't the gca
    set(fig,'currentaxes',ud.PlotHandle)
  end
end

%----------------------------------
function tf = islegend(h)
%ISLEGEND Return true if input is a legend handle
if length(h)==1,
  tf = ishandle(h) & strcmp(get(h,'tag'),'legend');
else
  tf = logical(0);
end


%-------------------------------
function [hl,labelhandles] = make_legend(ha,Kids,lstrings,legendpos,udinput,COL,linetypeinput)
%MAKE_LEGEND Make legend given parent axes, kids, and strings
%
%   MAKE_LEGEND(...,ud) is called from the resizeFcn.  In this case
%   just update the position of the legend pieces instead of recreating
%   it from scratch.

ud=udinput;
hf = get(ha,'parent'); % Parent figure

% Get the legend info structure from the inputs
info = legend_info(ha,hf,Kids,lstrings);

% Remember current state
hfold = find_gcf(ha);
haold = find_gca(ha);
punits=get(hf,'units');
aunits=get(ha,'units');
if strncmp(get(hf,'NextPlot'),'replace',7),
  set(hf,'NextPlot','add')
  oldNextPlot = get(hf,'NextPlot');
else
  oldNextPlot = '';
end
set(ha,'units','points');
set(hf,'units','points');

% Determine size of legend in figure points
fontn = get(ha,'fontname');
fonts = get(ha,'fontsize');
fonta = get(ha,'fontangle');
fontw = get(ha,'fontweight');
cap = get(ha,'Position');

% Symbols are the size of 3 numbers
h = text(0,0,'123','fontname',fontn,'fontsize',fonts,...
         'fontangle',fonta,'fontweight',fontw);
set(h,'units','points','visible','off');
ext = get(h,'extent');
lsym = ext(3);
loffset = lsym/3;
delete(h);

% Make box big enough to handle longest string
h=text(0,0,{info.label},'fontname',fontn,'fontsize',fonts,...
       'fontangle',fonta,'fontweight',fontw);
set(h,'units','points','visible','off');
ext = get(h,'extent');
width = ext(3);
height = ext(4)/size(get(h,'string'),1);
margin = height*0.075;
delete(h);

llen = width + loffset*3 + lsym; 
lhgt = ext(4) + 2*margin;

% Reset axis if it had be resized to that getposition works
if ~isempty(udinput),
  set(ha,'units','normalized','position',ud.PlotPosition)
  set(ha,'units','points')
end
  
[lpos,axpos] = getposition(ha,legendpos,llen,lhgt);

% Shrink axes if necessary
ud.PlotHandle = ha;
set(ha,'units','normalized')
ud.PlotPosition = get(ha,'position'); % Remember old axes position
set(ha,'units','points')
ud.legendpos = legendpos;
if ~isempty(axpos)
  set(ha,'Position',axpos)
end
set(ha,'units','normalized')
ud.AxesPosition = get(ha,'position');

% Create legend object
if find_gcf ~= hf & isempty(udinput), figure(hf); end
if strcmp(get(ha,'color'),'none')
  acolor = get(hf,'color');
else
  acolor = get(ha,'color');
end

if isempty(udinput)
  % Create legend axes and DeleteProxy object (an
  % invisible text object in target axes) so that the 
  % legend will get deleted correctly.
  ud.DeleteProxy = text('parent',ha,'visible','off', ...
                        'tag','LegendDeleteProxy',...
                        'handlevisibility','off');
  hl=axes('units','points','position',lpos,'box','on','drawmode', ...
        'fast','nextplot','add','xtick',[-1],'ytick',[-1], ...
        'xticklabel','','yticklabel','','xlim',[0 1],'ylim',[0 1], ...
        'clipping','on','color',acolor,'tag','legend','view',[0 90],...
        'climmode',get(ha,'climmode'),'clim',get(ha,'clim'),...
        'deletefcn','legend(''DeleteLegend'')');
  set(hl,'units','normalized')
  setappdata(hl,'NonDataObject',[]); % Used by DATACHILDREN.M
  ud.LegendPosition = get(hl,'position');
  set(ud.DeleteProxy,'deletefcn','eval(''delete(get(gcbo,''''userdata''''))'','''')');
  set(ud.DeleteProxy,'userdata',hl);
else
  hl = ud.LegendHandle;
  labelhandles = ud.LabelHandles;
  set(hl,'units','points','position',lpos);
  set(hl,'units','normalized')
  ud.LegendPosition = get(hl,'position');
end
  
texthandles = [];
objhandles = [];

nstack = length(info);
nrows = size(char(info.label),1);

% draw text one on chunk so that the text spacing is good
label = char(info.label);
top = (1-max(1,size(label,1)))/2;
fontn='Helvetica'; % ************************ Eliminate or change as desired ********************************* AB
%fonts=8; % ************************ Eliminate or change as desired ********************************* AB
if isempty(udinput)
  texthandles = text('parent',hl,'units','data',...
       'position',[1-(width+loffset)/llen,1-(1-top)/(nrows+1)],...
       'string',char(info.label),...
       'fontname',fontn,'fontweight',fontw,...
       'fontsize',fonts,'fontangle',fonta,...
       'ButtonDownFcn','moveaxis');
else
  texthandles = ud.LabelHandles(1);
  set(texthandles,'units','data',...
      'position',[1-(width+loffset)/llen,1-(1-top)/(nrows+1)],...
      'fontname',fontn,'fontsize',fonts);
end
     
ext = get(texthandles,'extent');
centers = linspace(ext(4)-ext(4)/nrows,0,nrows)+ext(4)/nrows/2 + 0.4*(1-ext(4));
edges = linspace(ext(4),0,nrows+1) + 0.4*(1-ext(4));
indent = [1 1 -1 -1 1] * ext(4)/nrows/7.5;

hpos = 2;
r = 1;
for i=1:nstack
  % draw lines with markers like this: --*--
    if exist('linetypeinput','var') & ~isempty(linetypeinput), % AB
        info(i).linetype = linetypeinput{i};
    end
    info(i).lnwidth=3; % AB *****************
  if strcmp(info(i).objtype,'line')
     if ~strcmp(info(i).linetype,'none')
        if isempty(udinput)
          p = line('parent',hl,'xdata',(loffset+[0 lsym])/llen,...
                   'ydata',[centers(r) centers(r)],...
                   'linestyle',info(i).linetype,...
                   'marker','none',...
                   'color',COL{i}, ...
                   'linewidth',info(i).lnwidth,...
                   'ButtonDownFcn','moveaxis');
        else
          p = ud.LabelHandles(hpos);
          set(p,'xdata',(loffset+[0 lsym])/llen,...
                'ydata',[centers(r) centers(r)]);
          hpos = hpos+1;
        end
     else
       p = [];
     end
     if ~strcmp(info(i).marker,'none')
       if isempty(udinput)
         p = [p;line('parent',hl,'xdata',(loffset+lsym/2)/llen,...
                    'ydata',centers(r),...
                    'color',COL{i}, ...
                    'linestyle','none',...
                    'linewidth',info(i).lnwidth,...
                    'marker',info(i).marker,...
                    'markeredgecolor',info(i).markedge,...
                    'markerfacecolor',info(i).markface,...
                    'markersize',info(i).marksize,...
                    'ButtonDownFcn','moveaxis')];
       else
         p2 = ud.LabelHandles(hpos);
         set(p2,'xdata',(loffset+lsym/2)/llen,...
               'ydata',centers(r));
         hpos = hpos+1;
         p = [p;p2];
       end
     end

  % draw patches
  elseif strcmp(info(i).objtype,'patch')  | strcmp(info(i).objtype,'surface')
     % Adjusting ydata to make a thinner box will produce nicer
     % results if you use patches with markers.
     if sempty(ud)
       p = patch('parent',hl,'xdata',(loffset+[0 lsym lsym 0 0])/llen,...
                  'ydata',[edges(r) edges(r) edges(r+1) edges(r+1) edges(r)]-indent,...
                  'linestyle',info(i).linetype,...
                  'edgecolor',info(i).edgecol, ...
                  'facecolor',info(i).facecol,...
                  'linewidth',info(i).lnwidth,...
                  'marker',info(i).marker,...
                  'markeredgecolor',COL{i},...
                  'markerfacecolor',COL{i},...
                  'markersize',info(i).marksize,...
                  'ButtonDownFcn','moveaxis');
     else
       p = ud.LabelHandles(hpos);
       set(p,'xdata',(loffset+[0 lsym lsym 0 0])/llen,...
             'ydata',[edges(r) edges(r) edges(r+1) edges(r+1) edges(r)]-indent);
       hpos = hpos+1;
     end
     if strcmp(info(i).facecol,'flat') | strcmp(info(i).edgecol,'flat')
        c = get(Kids(i),'cdata');
        k = min(find(finite(c)));
        if ~isempty(k)
          set(p,'cdata',c(k)*ones(1,5),...
                'cdatamapping',get(Kids(i),'cdatamapping'));
        end
     end
  end
  objhandles = [objhandles;p];
  r = r + max(1,size(info(i).label,1));
end

labelhandles = [texthandles;objhandles];

% Clean up a bit

set(hf,'currentaxes',haold)
set(hf,'units',punits)
set(ha,'units',aunits)
if (hfold ~= hf) & isempty(udinput), figure(hfold); end
if ~isempty(oldNextPlot)
  set(hf,'nextplot',oldNextPlot)
end
ud.handles = Kids;
ud.lstrings = {info.label};
ud.LabelHandles = labelhandles;
ud.LegendHandle = hl;
set(hl,'ButtonDownFcn','moveaxis','interruptible','on', ...
       'busyaction','queue','userdata',ud);

% Make legend resize itself
if isempty(get(hf,'resizefcn')),
  set(hf,'resizefcn','legend(''ResizeLegend'')')
end

if isempty(udinput)
  PlaceLegendOnTop(hf,hl,ha)
end

%------------------------------
function PlaceLegendOnTop(hf,hl,ha)
%PlaceLengendOpTop  Make sure the legend is on top of its axes.
ord = findobj(allchild(hf),'flat','type','axes');
axpos = find(ord==ha);
legpos = find(ord==hl);
if legpos ~= axpos-1
  axes(ord(axpos))
  axes(ord(legpos))
  for i=axpos-1:-1:1
    if i ~= legpos
      axes(ord(i)); 
    end
  end
end


%------------------------------
function info = legend_info(ha,hf,Kids,lstrings);
%LEGEND_INFO Get legend info from parent axes, Kids, and strings
%   INFO = LEGEND_INFO(HA,KIDS,STRINGS) returns a structure array containing
%      objtype  -- Type of object 'line', 'patch', or 'surface'
%      label    -- label string
%      linetype -- linetype;
%      edgecol  -- edge color
%      facecol  -- face color
%      lnwidth  -- line width
%      marker   -- marker
%      marksize -- markersize
%  