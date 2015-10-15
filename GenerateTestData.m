function testData = GenerateTestData(nBitError)
% Function for generating test inputs with error bit
global Exemplars NumberPerTrainingSet;

testData = [];
eSize = size(Exemplars);
id = 1;
for i = 1 : eSize(2) % Count training exemplars
    input = Exemplars(i).input;
    name = Exemplars(i).name;
	output = Exemplars(i).output;
	classID = Exemplars(i).classID;
    iSize = size(input);
    for j = 1: NumberPerTrainingSet
        row = [];
        col = [];
        flag = ones(iSize);
        bitErrorNum = 0;
        while bitErrorNum < nBitError
            x = ceil(rand(1) * iSize(1));
            y = ceil(rand(1) * iSize(2));
            if x <= 0
                x = 1;
            end
            if y <= 0
                y = 1;
            end
            if flag(x, y) ~= -1
                bitErrorNum = bitErrorNum + 1;
                flag(x, y) = -1;
                row = [row, x];
                col = [col, y];
            end
        end
        newInput = input;
        for p = 1:nBitError
            newInput(row(p), col(p)) = newInput(row(p), col(p)) * (-1);
        end
        testData(id).input = newInput;
        testData(id).name = name;
		testData(id).output = output;
		testData(id).classID = classID;
        id = id + 1;
    end
end