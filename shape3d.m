f = @(x,y) 4*(x-5).^2 + 3*(y-1).^2;
fsurf(f,[-100 100],'ShowContours','on')