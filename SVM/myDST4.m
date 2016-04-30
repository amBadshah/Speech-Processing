function dstProb=myDST4(prob)
m1M=prob(1,1);
m1F=prob(1,2);
m2M=0;
m2F=0;
resM=[m1M];
resF=[m1F];

    for i=2:length(prob)
        if(prob(i,1)>0.55 || prob(i,1)<0.45)
        m2M=m1M;
        m2F=m1F;
 
           
            mM=prob(i,1);
            mF=prob(i,2);
            
            conflict=(mM*m2F) + (mF*m2M);
            if(conflict<0.95)
               m1M=(mM*m2M)/(1-conflict);
                m1F=1-m1M;
                resM=[resM; m1M];
                resF=[resF; m1F];
            end
        end
    end

    dstProb = [resM, resF];