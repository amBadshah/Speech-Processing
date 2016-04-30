function dstProb=myDST4(prob)
m1M=0;
m1F=0;
m2M=0;
m2F=0;
resM=[];
resF=[];

    for i=1:length(prob)
        if(prob(i,1)>=0.55 || prob(i,1)<=0.45)
         if(m1M ==0 && m1F ==0)
            m1M=prob(i,1);
            m1F=prob(i,2);
            m2M=0;
            m2F=0;    
         else
            
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
    end

    dstProb = [resM, resF];