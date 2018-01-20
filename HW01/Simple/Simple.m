clc
clear



fprintf('Simple Fixed-Point Iteration\n');
Xi = input('Initial point = ');
tol = input('tolerance = ');
iter = input('Iteration = ');

for n = 1:1:iter
    
    
   test = pfun(Xi);
   Xu = fun(Xi);
   if(abs(test) <1)
     
    if(abs(Xu - Xi) < tol)
        root = Xu
        break;
       
    else
        Xi = Xu;
    end
   else
       fprintf('\n\nIncorrect Initial Point\n');
       fprintf('Please new Input\n\n');
       Xi = input('Initial point = ');      
   end
   
    
end

