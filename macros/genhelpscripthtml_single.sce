cd 'E:\Doc'

dd = listfiles();

for cnt = 1:size(dd,1);
fd=mopen(dd(cnt),'r');
a = mgetl(fd,-1);
mclose(fd);
b = [a(1:11);a(36:$)];
c = [b(1:$-19);b($-1:$)];
d = '<td valign=""top""><a href=""scilab://scilab.execexample/""><img src=""ScilabExecute.png"" border=""0""/></a></td><td valign=""top""><a href=""scilab://scilab.editexample/""><img src=""ScilabEdit.png"" border=""0""/></a></td><td></td>';

e = strsubst(c,d,'')
fd = mopen('E:\ScilabProject\trunk\Neural Network\Documentation\' + dd(cnt),'wt');
mputl(e,fd);
mclose(fd);
end


