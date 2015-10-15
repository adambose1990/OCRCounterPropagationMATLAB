function TrainNetwork()
% Function for training network with training exemplars
global CPNetwork Exemplars;

eSize = size(Exemplars);
kWeights = [];
gWeights = zeros(CPNetwork.gLayer.number, CPNetwork.kLayer.number);
for i = 1 : eSize(2) % Count training exemplars and applying weights
    mIn = Exemplars(i).input(:);
	mOut = Exemplars(i).output(:);
	mID = Exemplars(i).classID;
	mIn = mIn / sqrt(sum(mIn.*mIn));
	
	% training the Kohonen Layer
    prevWeights = CPNetwork.kLayer.neurons(mID).weights;
    weightUpdateNumber = CPNetwork.kLayer.neurons(mID).weightsUpdateNumber + 1;
    if weightUpdateNumber >= 1
        mIn = (prevWeights' * weightUpdateNumber + mIn) / weightUpdateNumber;
        mIn = mIn / sqrt(sum(mIn.*mIn));
    end
    CPNetwork.kLayer.neurons(mID).weights = mIn';
    CPNetwork.kLayer.neurons(mID).weightsUpdateNumber = weightUpdateNumber;
    kWeights = [kWeights; mIn'];
	
	% training the Grossberg Layer
    if weightUpdateNumber >= 1
        mOut = (mOut * weightUpdateNumber + mOut) / weightUpdateNumber;
    end
    gWeights(:, mID) = mOut;
end

for i = 1: CPNetwork.gLayer.number % store weights
    CPNetwork.gLayer.neurons(i).weights = gWeights(i,:);
end
CPNetwork.kLayer.weights = kWeights;
CPNetwork.gLayer.weights = gWeights;
end