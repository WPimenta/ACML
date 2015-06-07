function [ ] = ConstructTree( data, results, headers, options, usedOptions, k, tree )
%CONSTRUCTTREE Summary of this function goes here
%   Detailed explanation goes here

    [numNeg, numPos] = CountNegPos(results);
    h = H(numNeg, numPos, size(results,1));
    if(numNeg == 0 || numPos == 0)
        if(numNeg > 0)
            tree{k} = 'no';
            k = k + 1;
        elseif(numPos > 0)
            tree{k} = 'yes';
            k = k + 1;
        end
    else
        [nodeIndex, infGain] = MaxInfGainNode(data, results, options, usedOptions, h);
        disp(['Best node is ' headers{nodeIndex} ' with an information gain of ' num2str(infGain)]);
        tree{k} = headers{nodeIndex};
        k = k + 1;
        for i = 1:size(options{nodeIndex})
            [S_, R_] = GetRecordsForSubOption(data, nodeIndex, options{nodeIndex}{i}, results);
            if (size(usedOptions,1) == 0)
                usedOptions{1} = nodeIndex;
            else
                usedOptions{size(usedOptions,1)+1} = nodeIndex;
            end
            %S_ = newS(data, headers{nodeIndex}, options{nodeIndex}{i});
            ConstructTree(S_, R_, headers, options, usedOptions, k, tree);
        end
    end
    
end

