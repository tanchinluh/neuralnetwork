function handles = ann_training_process();
// Training Process GUI
//
//    Copyright 2011 Trity Technologies.
//    
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 2 of the License, or
//    (at your option) any later version.
//    
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//    
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/
//
// Description
//     Training Process GUI to visualize the training process for neural network
//
// Authors
//     Tan C.L.    
    
handles.dummy = 0;
handles.f=figure('position',[300 50 320 480]);
f = gcf();

delmenu(f.figure_id, gettext('File'));
delmenu(f.figure_id, gettext('Edit'));
delmenu(f.figure_id, gettext('Tools'));
delmenu(f.figure_id, gettext('?'));
toolbar(f.figure_id,'off');

x_ref = 0.15;
y_ref = 0.7;
w_ref = 0.7;
h_ref = 0.045;

BGColor = [204 204 204]./255

// Title
handles.title = uicontrol(handles.f,'unit','normalized','Position',[x_ref,y_ref+0.2,w_ref,h_ref],'Style','text','String','Neural Network Training','fontsize',16,'FontWeight','bold','backgroundcolor',BGColor);

// MSE Slider
handles.msetitle = uicontrol(handles.f,'unit','normalized','Position',[x_ref,y_ref+0.05,w_ref,h_ref],'Style','text','String','MSE:','fontsize',12,'FontWeight','bold','backgroundcolor',BGColor);
handles.mse=uicontrol(handles.f,'unit','normalized','foregroundColor',[1 1 1],'enable','off','Max',[100],'Min',[0],'Position',[x_ref,y_ref,w_ref,h_ref],'SliderStep',[0.01,0.1],'Style','slider','Value',0,'backgroundcolor',BGColor);
handles.msemax = uicontrol(handles.f,'unit','normalized','Position',[x_ref-0.1,y_ref,w_ref-0.6,h_ref],'Style','text','String','10','fontsize',12,'backgroundcolor',BGColor);
handles.msemin = uicontrol(handles.f,'unit','normalized','Position',[x_ref+0.7,y_ref,w_ref-0.5,h_ref],'Style','text','String','0','fontsize',12,'backgroundcolor',BGColor);
handles.msecurrent = uicontrol(handles.f,'unit','normalized','Position',[x_ref+0.3,y_ref-0.05,w_ref,h_ref],'Style','text','String','0','fontsize',12,'backgroundcolor',BGColor);

// Iteration Slider
handles.itertitle = uicontrol(handles.f,'unit','normalized','Position',[x_ref,y_ref-0.1,w_ref,h_ref],'Style','text','String','Epoch:','fontsize',12,'FontWeight','bold','backgroundcolor',BGColor);
handles.iter=uicontrol(handles.f,'unit','normalized','enable','off','Max',[100],'Min',[0],'Position',[x_ref,y_ref-0.15,w_ref,h_ref],'SliderStep',[0.01,0.1],'Style','slider','Value',0,'tag','iter','backgroundcolor',BGColor);
handles.itermin = uicontrol(handles.f,'unit','normalized','Position',[x_ref-0.1,y_ref-0.15,w_ref-0.6,h_ref],'Style','text','String','0','fontsize',12,'backgroundcolor',BGColor);
handles.itermax = uicontrol(handles.f,'unit','normalized','Position',[x_ref+0.7,y_ref-0.15,w_ref-0.5,h_ref],'Style','text','String','100','fontsize',12,'backgroundcolor',BGColor);
handles.itercurrent = uicontrol(handles.f,'unit','normalized','Position',[x_ref+0.3,y_ref-0.2,w_ref,h_ref],'Style','text','String','1','fontsize',12,'backgroundcolor',BGColor);

// Gradient Slider
handles.gdtitle = uicontrol(handles.f,'unit','normalized','Position',[x_ref,y_ref-0.25,w_ref,h_ref],'Style','text','String','Gradient:','fontsize',12,'FontWeight','bold','backgroundcolor',BGColor);
handles.gd=uicontrol(handles.f,'unit','normalized','enable','off','Max',[100],'Min',[0],'Position',[x_ref,y_ref-0.3,w_ref,h_ref],'SliderStep',[0.01,0.1],'Style','slider','Value',0,'backgroundcolor',BGColor);
handles.gdmax = uicontrol(handles.f,'unit','normalized','Position',[x_ref-0.1,y_ref-0.3,w_ref-0.6,h_ref],'Style','text','String','0','fontsize',12,'backgroundcolor',BGColor);
handles.gdmin = uicontrol(handles.f,'unit','normalized','Position',[x_ref+0.7,y_ref-0.3,w_ref-0.5,h_ref],'Style','text','String','100','fontsize',12,'backgroundcolor',BGColor);
handles.gdcurrent = uicontrol(handles.f,'unit','normalized','Position',[x_ref+0.3,y_ref-0.35,w_ref,h_ref],'Style','text','String','1','fontsize',12,'backgroundcolor',BGColor);
endfunction

//////////
// Callbacks are defined as below. Please do not delete the comments as it will be used in coming version
//////////

