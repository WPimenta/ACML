function [ ] = ConstructTree( S, header, options, k )
%CONSTRUCTTREE Summary of this function goes here
%   Detailed explanation goes here

    [numNeg, numPos] = CountNeg(S);
    h = H(numNeg, numPos);
    if(numNeg == 0 || numPos == 0)
        if(numNeg > 0)
            tree{k} = 'no';
            k = k + 1;
        elseif(numPos > 0)
            tree{k} = 'yes';
            k = k + 1;
        end
    else
        nodeIndex = MaxInfGainNode(S, h);
        tree{k} = header{nodeIndex};
        k = k + 1;
        for i = 1:sizeof(options{nodeIndex})
            S_ = newS(S, header{nodeIndex}, options{nodeIndex}{i});
            ConstructTree(S_, k);
        end
    end
end

