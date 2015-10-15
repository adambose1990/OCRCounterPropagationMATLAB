function TestWithExemplars()
% funtion for test with trained/untrained exemplar
global Exemplars;

str = [];
eSize = size(Exemplars);
for i = 1 : eSize(2) % Count exemplar
    Propagation(Exemplars(i).input);
    [output] = Classification();
    if strcmp(output.Name, Exemplars(i).name)
        astr = ['Training set: ', num2str(i), ': Pass: Error: ', num2str(output.Error)];
    else
        astr = ['Training set: ', num2str(i), ': Untrained'];
    end
    str = char(str, astr);
end
disp(str);
end