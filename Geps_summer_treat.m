function Geps_summer_treat
clc;close all;

f = figure(); % create a figure with an axes on it
ax = axes('Units','pixels', 'Position',[0 0 560 420], 'XTick',[], 'YTick',[], ...
          'Nextplot','add', 'YDir','reverse');
 
%read the big logo image - just a  background for our figure
bigImage = imread('Matlab_LogoBig.png');
image(bigImage, 'parent', ax);  % Display the image in the axes

%% 'simple' button
disp(' ')
disp('A simple dark button with 3 states (inactive/roll over/active)')
disp('Note: text/font can be changed only via the relevant layer in photoshop');

%import icon images (found on the net & processed in photoshop)
img = imread(['extracted' filesep '005_simplebuttons1.jpg']);
s = size(img);
pos = [10 10 s(2) s(1)];  %Position of the button

%create a push button
pb = uicontrol('Style','pushbutton', 'Units','pixels', 'Position',pos, ...
               'Callback',@(a,b)disp('dark says: Με πατας ρε!'));
           
 % Update the push button image
 %must be an m-n-3 image
set(pb, 'CData', img)

%java method exposed (could brake in later releases)
%needs the external utility findjobj
%=================================
pbj = findjobj(pb);
%remove border
pbj.Border = [];

%Set an icon for mouse rollover
img = imread(['extracted' filesep '005_simplebuttons2.jpg']);
pbj.setRolloverIcon(javax.swing.ImageIcon(im2java(img)));

%Set an icon for mouse click
img = imread(['extracted' filesep '005_simplebuttons3.jpg']);
pbj.setPressedIcon(javax.swing.ImageIcon(im2java(img)));

%refresh all icons
pbj.repaint;

disp(' ');
pause;

%% Another 'simple' button with border
disp(' ')
disp('Another light simple button with 3 states and green border')
disp('(Ugly matlab''s but maybe useful in some cases)')
disp(' ')
%import icon images (found on the net & processed in photoshop)
img = imread(['extracted' filesep '005_simplebuttonsl1.jpg']);
s = size(img);
pos = [10+s(2) 10 s(2) s(1)];  %Position of the button

%create a push button
pb = uicontrol('Style','pushbutton', 'Units','pixels', 'Position',pos, ...
               'Callback',@(a,b)disp('light says: Με πατας ρε!'));
           
 % Update the push button image
 %must be an m-n-3 image
set(pb, 'CData', img)

%java method exposed (could brake in later releases)
%needs the external utility findjobj
%=================================
pbj = findjobj(pb);
%remove put a green border just for fun

lineColor = java.awt.Color(0,1,0);  % =green
thickness = 3;  % pixels
roundedCorners = true;
newBorder = javax.swing.border.LineBorder(lineColor,thickness,roundedCorners);
pbj.Border = newBorder;

%Set an icon for mouse rollover
img = imread(['extracted' filesep '005_simplebuttonsl2.jpg']);
pbj.setRolloverIcon(javax.swing.ImageIcon(im2java(img)));

%Set an icon for mouse click
img = imread(['extracted' filesep '005_simplebuttonsl3.jpg']);
pbj.setPressedIcon(javax.swing.ImageIcon(im2java(img)));

%refresh all icons
pbj.repaint;

disp(' ');
pause;

%% A chunky color button
disp(' ')
disp('A chunky color toggle button (deep push) with NO focus line')
disp(' ')

%import icon images (found on the net & processed in photoshop)
%depressed icon
img1 = imread(['extracted' filesep '3d-web-buttons1.jpg']);
s = size(img1);
pos = [10 55 s(2) s(1)];  %Position of the button
%pressed icon
img2 = imread(['extracted' filesep '3d-web-buttons3.jpg']);

%create a toggle button
pbt = uicontrol('Style','togglebutton', 'Units','pixels', 'Position',pos, ...
               'Callback',@toggleCallback);
           
 % Update the push button image
 %must be an m-n-3 image
set(pbt, 'CData', img1)

%toggle icons when clicking
    function toggleCallback(hobj,~)
        button_state = get(hobj,'Value');
        if button_state == get(hobj,'Max')
            set(pbt, 'CData', img2)            
        else
              set(pbt, 'CData', img1)      
        end
        disp('Toggle IT');
    end

%java method exposed (could brake in later releases)
%needs the external utility findjobj
%=================================
pbjt = findjobj(pbt);
% remove border & focus (yeah)
pbjt.Border = [];
pbjt.FocusPainted=0;

%Set an icon for mouse rollover
img3 = imread(['extracted' filesep '3d-web-buttons2.jpg']);
pbjt.setRolloverIcon(javax.swing.ImageIcon(im2java(img3)));

%refresh all icons
pbjt.repaint;

disp(' ');
pause;

%% A round button
disp(' ')
disp('At last a round button...')
disp(' ')

% import icon images (found on the net & processed in photoshop)
img = imread(['extracted' filesep 'download-buttons1.jpg']);
s = size(img);
pos = [10 100 s(2) s(1)];  %Position of the button

% create a push button
pb = uicontrol('Style','pushbutton', 'Units','pixels', 'Position',pos, ...
               'Callback',@(a,b)disp('round says: Με πατας ρε!'));
           
%  Update the push button image
%  must be an m-n-3 image
set(pb, 'CData', img)

% java method exposed (could brake in later releases)
% needs the external utility findjobj
%=================================
pbj = findjobj(pb);
% remove border and focus
pbj.Border = [];
pbj.FocusPainted=0;

% refresh all icons
pbj.repaint;

% Set an icon for mouse rollover
img =  imread(['extracted' filesep 'download-buttons2.jpg']);
pbj.setRolloverIcon(javax.swing.ImageIcon(im2java(img)));

% Set an icon for mouse click
img = imread(['extracted' filesep 'download-buttons3.jpg']);
pbj.setPressedIcon(javax.swing.ImageIcon(im2java(img)));
 
disp(' ');
pause;

%% Dedicated %%
clc;
disp(' ')
disp('Now we can go all crazy..')
disp('Actually we can have buttons in any shape..')
disp('what we need...:')
disp('1. The buttons'' icons extracted from psds')
disp('2: (extra) a shade layer in photoshop with a (close) color to the image underneath the button')
disp('3. A mask of the button''s outline')
disp('4. Two matlab/java hacks;)')
disp('')
pause;

 img11 = imread(['extracted' filesep 'power1.jpg']);
 img21 = imread(['extracted' filesep 'power2.jpg']);
 img31 = imread(['extracted' filesep 'power3.jpg']);
 s = size(img11);
 pos = [380 200 s(2) s(1)];
 
 mask=imread(['extracted' filesep 'power_mask.jpg']);
 mask=rgb2gray(mask);
 mask=mask>20; %not 0 due to mask aliazing

F = getframe(ax,pos);  % take a screenshot of the parent figure 
% for each pixel, replace the white portion of the mask with the parent image data
%this is the only way to disguise the rectangular icon to a round one
for idx = 1 : 3
   rgb = img11(:,:,idx);                  
   pImage = double(F.cdata(:,:,idx));  % extract part of the image
   rgb(mask) = pImage(mask);   % set the white portion of the image to the parent
   img11(:,:,idx) = rgb;                     % substitute the update values
   
   rgb = img21(:,:,idx);                   
   pImage = double(F.cdata(:,:,idx));  % extract part of the image
   rgb(mask) = pImage(mask);   % set the white portion of the image to the parent
   img21(:,:,idx) = rgb;                     % substitute the update values
    
    rgb = img31(:,:,idx);                   
   pImage = double(F.cdata(:,:,idx));  % extract part of the image
   rgb(mask) = pImage(mask);   % set the white portion of the image to the parent
   img31(:,:,idx) = rgb;                     % substitute the update values
end
   
%draw the button
pbtt = uicontrol('Style','togglebutton', 'Units','pixels', 'Position',pos, ...
               'Callback',@toggleCallback2);

 % Update the push button image
set(pbtt, 'CData', img11);

% toggle icons when clicking
    function toggleCallback2(hobj,~)
                button_state = get(hobj,'Value');
        if button_state == get(hobj,'Max')
            set(pbtt, 'CData', img21)            
        else
              set(pbtt, 'CData', img11)      
        end
    end
 
% java method exposed (could brake in later releases)
% needs the external utility findjobj
%=================================
pbj = findjobj(pbtt);
% remove border & focus
pbj.Border = [];
pbj.FocusPainted=0;

 % refresh all icons
pbj.repaint;

%we need to set an intermediate button state
%to complete the optical illussion, which is
%available only via pure java callback
set(pbj,'MousePressedCallback',@istate);
    function istate(hobj,~)
        set(pbtt, 'CData', img31);
    end

pause;
disp(' ')
disp('That'' it folks.. Have a nice summer!')
end
