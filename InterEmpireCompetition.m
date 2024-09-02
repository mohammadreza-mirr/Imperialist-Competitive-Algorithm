function emp=InterEmpireCompetition(emp)

    TotalCost=[emp.TotalCost];
    [~,WeakestEmpIndex]=max(TotalCost);
    WeakestEmp=emp(WeakestEmpIndex);
    
    [~,WeakestColIndex]=max([WeakestEmpCol.Costs]);
    WeakestCol=WeakestEmp.Col(WeakestColIndex);
    
    p=exp(-alpha*TotalCost/max(TotalCost));
    p(WeakestEmpIndex)=0;
    p=p/sum(p);
    
   WinnerEmpIndex=RouletteWheelSelection(p);
   
   WinnerEmp=emp(WinnerEmpIndex);
   
   WinnerEmp.Col=[WinnerEmp.Col;WeakestCol];
   
   WinnerEmp.nCol=WinnerEmp.nCol+1;
   emp(WinnerEmpIndex)=WinnerEmp;
   
   WeakestEmp.Col(WeakestColIndex)=[];
   WeakestEmp.nCol=WeakestEmp.nCol-1;
   
   if WeakestEmp.nCol==0
       WinnerEmpIndex2=RouletteWheeleSelection(p);
       WinnerEmp2=emp(WinnerRmpIndex2);
       
       WinnerEmp2.Col=[WinnerEmp2.Col;WeakestEmp.Imp];
       WinnerEmp2.nCol=WinnerEmp.nCol+1;
       emp(WinnerRmpIndex2)=WinnerEmp2;
       
       WeakestEmp=[];
   
   end
   emp(WeakestEmpIndex)= WeakestEmp;
   

end