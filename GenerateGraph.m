function GenerateGraph(nBitError)
% Function for generating Error rate vs Number of error bit graph
for i = 1 : nBitError
    errorate(i) = RecognitionWithError(i);
end
figure;
plot(errorate, 'LineWidth', 2);
xlabel('Number of error bit');
ylabel('Error rate');
end