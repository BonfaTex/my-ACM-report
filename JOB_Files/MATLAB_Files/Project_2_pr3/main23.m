%% Problem 2 - Square hole in a square
clear; clc; 

% Set the maximum dimensions
N = 24;
IN = 8;
NB = 2; % # boundaries
NL = [16; 24]; % last point of each boundary

% Set data
XL = [0; 0.25; 0.5; 0.75; 1; 1; 1; 1; 1; 0.75; 0.5; 0.25; 0; 0; 0; 0;
      0.3; 0.3; 0.3; 0.5; 0.7; 0.7; 0.7; 0.5];
YL = [0; 0; 0; 0; 0; 0.25; 0.5; 0.75; 1; 1; 1; 1; 1; 0.75; 0.5; 0.25;
      0.3; 0.5; 0.7; 0.7; 0.7; 0.5; 0.3; 0.3];
INDEX = [1; 1; 1; 1; 0; 0; 0; 0; 1; 1; 1; 1; 0; 0; 0; 0; 
         0; 0; 1; 1; 1; 1; 1; 1];
UB = [0; 0; 0; 0; 200; 200; 200; 200; 0; 0; 0; 0; 100; 100; 100; 100; 
      130; 130; 0; 0; -100; -100; 0; 0];
XIN = [0.15; 0.5; 0.85; 0.15; 0.85; 0.15; 0.5; 0.85];
YIN = [0.15; 0.15; 0.15; 0.5; 0.5; 0.85; 0.85; 0.85];

% Compute midpoints
[XM, YM] = holeMIDPOINTS(XL, YL, NB, NL);

% Print data
holeINPUT(XL, YL, XM, YM, XIN, YIN, INDEX, UB, N, IN, NB, NL);

% % Compute the G matrix
G = holeGMATR(XL, YL, XM, YM, N, NB, NL);

% Compute the H matrix
H = holeHMATR(XL, YL, XM, YM, N, NB, NL);

% Form the system of equations AX=B
[A, UNB] = ABMATR(G, H, UB, INDEX);

% Solve the system of equations
UNB = A\UNB;

% Form the vectors U and UN of all the boundary values
[UB, UNB] = REORDER(UB, UNB, INDEX);

% Compute the values UIN of u at the internal points
UIN = holeUINTER(XL, YL, XIN, YIN, UB, UNB, N, IN, NL, NB);

% Print results
holeOUTPUT(XM, YM, XIN, YIN, UB, UNB, UIN, N, IN, NL, NB);



