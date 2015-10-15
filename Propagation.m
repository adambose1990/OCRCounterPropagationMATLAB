function Propagation(inputData)
% Function for propagating the Hopfield 
global CPNetwork;

%% get inputs
nnInputs = inputData(:);

%% propagation of Kohonen Layer
zOut = CPNetwork.kLayer.weights * nnInputs;
[~, zMaxInd] = max(zOut);
yOut = zeros(size(zOut));
yOut(zMaxInd) = 1;
CPNetwork.kLayer.Z = zOut;
CPNetwork.kLayer.output = yOut;
for i = 1 : CPNetwork.kLayer.number
    CPNetwork.kLayer.neurons(i).z = zOut(i);
    CPNetwork.kLayer.neurons(i).y = yOut(i);
end

%% propagation of Grossberg Layer
zOut = CPNetwork.gLayer.weights * yOut;
yOut = zOut;
CPNetwork.gLayer.analogOutput = zOut;
CPNetwork.gLayer.output = yOut;
for i = 1 : CPNetwork.gLayer.number
    CPNetwork.gLayer.neurons(i).z = zOut(i);
    CPNetwork.gLayer.neurons(i).y = yOut(i);
end
end