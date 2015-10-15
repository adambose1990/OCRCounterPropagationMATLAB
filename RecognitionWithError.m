function [errorrate] = RecognitionWithError(nBitError)
% Function for recognition with error

testData = GenerateTestData(nBitError);
tSize = size(testData);
str = [];
success = 0;
for i = 1: tSize(2) % count number of testdata
    Propagation(testData(i).input);
    [output] = Classification();
    strFormat = ' ';
    vstr = char(strFormat,num2str(i));
    if strcmp(output.Name, testData(i).name)
        success = success + 1;
        astr = [vstr(2,:), ': Pass -> Error: ', num2str(output.Error)];
    else
        astr = [vstr(2,:), ': Fail'];
    end
    str = char(str, astr);
end
errorrate = 100 - (success*100/tSize(2));
astr = ['Error rate: ', num2str(errorrate),'%'];
str = char(str, astr);
disp(str);
end