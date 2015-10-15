function [output] = Classification()
% Function for Hopfield classification
global CPNetwork Exemplars;

delta = [];
eSize = size(Exemplars);
outputG = CPNetwork.gLayer.output;
for i = 1 : eSize(2) % Count training exemplars
    aSet = Exemplars(i).output(:);
    diff = abs(aSet - outputG);
    diff = diff.^2;
    newError = sum(diff);
    delta = [delta, newError];
end
[eMin, eInd] = min(delta);
output.Name = Exemplars(eInd).name;
output.Vector = Exemplars(eInd).output;
output.ClassID = Exemplars(eInd).classID;
output.Error = eMin;
end