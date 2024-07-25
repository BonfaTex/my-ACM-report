%% Problem 1 - Benchmark
clear; clc; 

% Set the maximum dimensions
N = 16;
IN = 9;

% Set data
XL = [0; 0.25; 0.5; 0.75; 1; 1; 1; 1; 1; 0.75; 0.5; 0.25; 0; 0; 0; 0];
YL = [0; 0; 0; 0; 0; 0.25; 0.5; 0.75; 1; 1; 1; 1; 1; 0.75; 0.5; 0.25];
XIN = [0.25; 0.5; 0.75; 0.25; 0.5; 0.75; 0.25; 0.5; 0.75];
YIN = [0.25; 0.25; 0.25; 0.5; 0.5; 0.5; 0.75; 0.75; 0.75];
INDEX = [1; 1; 1; 1; 0; 0; 0; 0; 1; 1; 1; 1; 0; 0; 0; 0];
UB = [0; 0; 0; 0; 200; 200; 200; 200; 0; 0; 0; 0; 100; 100; 100; 100];

% Compute midpoints
[XM, YM] = MIDPOINTS(XL, YL, N);

% Print data
INPUT(XL, YL, XM, YM, XIN, YIN, INDEX, UB, N, IN);

% Compute the G matrix
G = GMATR(XL, YL, XM, YM, N);

% Compute the H matrix
H = HMATR(XL, YL, XM, YM, N);

% Form the system of equations AX=B
[A, UNB] = ABMATR(G, H, UB, INDEX);

% Solve the system of equations
UNB = A\UNB;

% Form the vectors U and UN of all the boundary values
[UB, UNB] = REORDER(UB, UNB, INDEX);

% Compute the values UIN of u at the internal points
UIN = UINTER(XL, YL, XIN, YIN, UB, UNB, N, IN);

% Print results
OUTPUT(XM, YM, XIN, YIN, UB, UNB, UIN, N, IN);





