%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECE 599 Neural Networs                                       %
% Name: Arindam Bose                                           %
% UIN: 665387232                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Implementation of Character Recognition system using Counter Propagation Neural Network
%% Initialization
Initialization();

%% Main menu
first = true;
while first
    clc;
    disp('------------- Main Menu -------------');
	disp('1: Train network'); 
	disp('2: Test with trained exemplars');
    disp('3: Test with noise');
    disp('4: Generate graph for error rates');
	disp('0: Exit'); 
    ch = input('Your choice: ', 's');
    switch ch
        case '1'
            tic;
            TrainNetwork(); % Train network
            t = toc;
            disp(['Training complete in ' num2str(t) ' sec']);
        case '2'
            tic;
            TestWithExemplars(); % Test with trained exemplars A, C, N, others
            t = toc;
            disp(['Testing trained exemplar complete in ' num2str(t) ' sec']);
        case '3'
            n = input('Number of error bits ? ');
            RecognitionWithError(n); % Recognition with noise
        case '4'
            n = input('Number of final error bits ? ');
            GenerateGraph(n);
        case '0'
            first = false;
            disp('Exiting...');
    end
    disp('Press any key to continue...');
    pause;
end
clear all;