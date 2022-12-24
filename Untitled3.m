nb=[];
nm=[];
ns=[];
z=[];
ps=[];
pm=[];
pb=[];
for i=1:length(result)
    if result(i,3)==1
       nb=[nb;result(i,1)]; 
    elseif result(i,3)==2
       nm=[nm;result(i,1)]; 
    elseif result(i,3)==3
        ns=[ns;result(i,1)];
    elseif result(i,3)==4
        z=[z;result(i,1)];
    elseif result(i,3)==5
        ps=[ps;result(i,1)] 
    elseif result(i,3)==6
        pm=[pm;result(i,1)] 
    elseif result(i,3)==7
        pb=[pb;result(i,1)] 
    end
    
end
