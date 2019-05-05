function outputArray = lfsr_detection_old(inputArray, endArray)

% calculate mean of each Channel
% meanD = mean(inputArray(:,2));
% disp(meanD);
% meanE = mean(inputArray(:,3));
% disp(meanE);

% % Converting [table > array]
% inputArray = table2array(inputTable);

% % Transpose inputArray
% inputArray = inputArray';


% Convert Voltage Level into Digital Values by if-else-statement
% for i=1:endArray
%     if(inputArray(i,2) < 1.7)
%         inputArray(i,2) = 0;
%     elseif(inputArray(i,2) > 1.7)
%         inputArray(i,2) = 1;
%     else
%         inputArray(i,2) = 7;
%     end
%     
%     if(inputArray(i,3) < 1.7)
%         inputArray(i,3) = 0;
%     elseif(inputArray(i,3) > 1.7)
%         inputArray(i,3) = 1;
%     else
%         inputArray(i,3) = 7;
%     end
% end

endLFSR = endArray/20 - 1;

% initialize matrix/vector for Gaussian Elimination
A = zeros(20);
B = zeros(20,1);
% outputArray = zeros(20,endLFSR);
Data = inputArray(:,2)';

% insert values to matrix A und vector B and use Gaussian Elimination
for i=1:endLFSR
    for j=1:20
        A(j,:) = Data((j-1)+(1:20));
        B(j) = Data((20*j)+1);
    end
    x = mod(mldivide(A,B),2);
    
    outputArray(j,:) = x;
end

outputArray = x;

end