%Matthew Tam's code Sep 26th


a = input ('First leading coefficent of the polynomial equation?');
b = input('Second leading coefficent of the polynomial equation?');
c = input('Third leading coefficent of the polynomial equation?');
%Asks for 1st to 3rd numerial value from the client using the input()
%function. The argument is the prompt which allows the client to see their
%question. 
root1 = (-b + sqrt(b^2-4*a*c))/(2*a);
root2 = (-b - sqrt(b^2-4*a*c))/(2*a);
%Using the quadratic equation to find the root of the equation. Since I
%cannot find the plus or minus sign symbol, I seperated both roots with
%different operator to find the two roots. 



root1
root2 

%Return 2 answers. 
