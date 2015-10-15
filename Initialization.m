function Initialization()
% Initialization of global variables and initial weights
%% Global variabls 
global CPNetwork Exemplars NumberPerTrainingSet;

NoOfNeuron = 64;
weightRange = [-0.5 0.5];
NumberPerTrainingSet = 250;

%% Exemplar definition
Exemplars = [];
Exemplars(1).input = [ -1, -1, -1,  1,  1, -1, -1, -1; ... % 'Letter A'
                       -1, -1,  1, -1, -1,  1, -1, -1; ...
                       -1,  1, -1, -1, -1, -1,  1, -1; ...
                        1, -1, -1, -1, -1, -1, -1,  1; ...
                        1,  1,  1,  1,  1,  1,  1,  1; ...
                        1, -1, -1, -1, -1, -1, -1,  1; ...
                        1, -1, -1, -1, -1, -1, -1,  1; ...
                        1, -1, -1, -1, -1, -1, -1,  1];
Exemplars(1).name = 'A';
Exemplars(1).classID = 1;
Exemplars(1).output = [0 0 1];

Exemplars(2).input = [ -1, -1,  1,  1,  1,  1,  1,  1;  ... % 'Letter C'
                       -1,  1, -1, -1, -1, -1, -1, -1; ...
                        1, -1, -1, -1, -1, -1, -1, -1; ...
                        1, -1, -1, -1, -1, -1, -1, -1; ...
                        1, -1, -1, -1, -1, -1, -1, -1; ...
                        1, -1, -1, -1, -1, -1, -1, -1; ...
                       -1,  1, -1, -1, -1, -1, -1, -1; ...
                       -1, -1,  1,  1,  1,  1,  1,  1];
Exemplars(2).name = 'C';
Exemplars(2).classID = 2;
Exemplars(2).output = [0 1 0];

Exemplars(3).input = [  1, -1, -1, -1, -1, -1, -1, 1;  ... % 'Letter N'
                        1,  1, -1, -1, -1, -1, -1, 1; ...
                        1, -1,  1, -1, -1, -1, -1, 1; ...
                        1, -1, -1,  1, -1, -1, -1, 1; ...
                        1, -1, -1, -1,  1, -1, -1, 1; ...
                        1, -1, -1, -1, -1,  1, -1, 1; ...
                        1, -1, -1, -1, -1, -1,  1, 1; ...
                        1, -1, -1, -1, -1, -1, -1, 1];
Exemplars(3).name = 'N';
Exemplars(3).classID = 3;
Exemplars(3).output = [1 0 0];
                 
Exemplars(4).input = [  1, -1, -1, -1, -1, -1, -1,  1;  ... % 'Letter X'
                       -1,  1, -1, -1, -1, -1,  1, -1; ...
                       -1, -1,  1, -1, -1,  1, -1, -1; ...
                       -1, -1, -1,  1,  1, -1, -1, -1; ...
                       -1, -1, -1,  1,  1, -1, -1, -1; ...
                       -1, -1,  1, -1, -1,  1, -1, -1; ...
                       -1,  1, -1, -1, -1, -1,  1, -1; ...
                        1, -1, -1, -1, -1, -1, -1,  1];
Exemplars(4).name = 'X';
Exemplars(4).classID = 4;
Exemplars(4).output = [0 0 0];

%% Counter Propagation network structure
CPNetwork = [];
CPNetwork.layerMatrix = [NoOfNeuron size(Exemplars,2) size(Exemplars(1).output,2)];

%% Kohonen layer
kLayer.number = CPNetwork.layerMatrix(2);
kLayer.error = [];
kLayer.output = [];
kLayer.neurons = [];
kLayer.Z = [];
kLayer.weights = [];

% create a default layer
for i = 1: kLayer.number
	% create a default neuron
	neuron = [];
    offset = (weightRange(1) + weightRange(2))/2.0;
    range = abs(weightRange(2) - weightRange(1));
    weights = (rand(1, CPNetwork.layerMatrix(1)) - 0.5 )* range + offset;

    neuron.weights = weights;
	neuron.weightsUpdateNumber = 0;
    neuron.z = 0;
    neuron.y = 0;
    kLayer.neurons = [kLayer.neurons, neuron];
    kLayer.weights = [kLayer.weights; weights];
end
CPNetwork.kLayer = kLayer;

%% Grossberg Layer
gLayer.number = CPNetwork.layerMatrix(3);
gLayer.error = [];
gLayer.output = [];
gLayer.neurons = [];
gLayer.Z = [];
gLayer.weights = [];
% create a default layer
for ind = 1: gLayer.number
	% create a default neuron
	neuron = [];
    offset = (weightRange(1) + weightRange(2))/2.0;
    range = abs(weightRange(2) - weightRange(1));
    weights = (rand(1, CPNetwork.layerMatrix(2)) - 0.5 )* range + offset;
	
    neuron.weights = weights;
    neuron.weightsUpdateNumber = 0;
    neuron.z = 0;
    neuron.y = 0;
    gLayer.neurons = [gLayer.neurons, neuron];
    gLayer.weights = [gLayer.weights; weights];
end
CPNetwork.gLayer = gLayer;
end