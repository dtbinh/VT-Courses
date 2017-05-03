function [f_dot]  = floc (t, f, N)

r=.011;
N=350;
M=10;
h=.5; % height in meters

I=M*.5*[.5*r^2+h^2/6 0 0; 0 .5*r^2+h^2/6 0; 0 0 r^2]; % Inertia tensor of solid cylinder 

In1=zeros(2*N, 2*N); 
for i=1:2:2*N
    for j=1:2:2*N
        if i==j
            In1(i,j)=I(1,1);
        else
            In1(i,j)=0;
        end
    end
end

In2=zeros(2*N, 2*N);
for i=2:2:2*N
    for j=2:2:2*N
        if i==j
            In2(i,j)=I(2,2);
        else
            In2(i,j)=0;
        end
    end
end

In3=In1+In2;


rx=0:1/((N/2)+1):1;
ry=sqrt(1-(rx.^2));

rz=0:1/((N/2)+1):1;
rt=-sqrt(1-(rz.^2));

ryf=[rt ry];
rxf=[rx rz];

R1=zeros(2*N, 2*N);
for i=1:N
    for j=1:N
        for k=1:2:2*N
            for l=1:2:2*N
                R1(k,l)=-ryf(i)*ryf(j);
            end
        end
    end
end  

R2=zeros(2*N, 2*N);
for i=1:N
    for j=1:N
        for k=1:2:2*N
            for l=2:2:2*N
                R2(k,l)=ryf(i)*rxf(j);
            end
        end
    end
end 

R3=zeros(2*N, 2*N);
for i=1:N
    for j=1:N
        for k=2:2:2*N
            for l=1:2:2*N
                R3(k,l)=-rxf(i)*ryf(j);
            end
        end
    end
end 

R4=zeros(2*N, 2*N);
for i=1:N
    for j=1:N
        for k=2:2:2*N
            for l=2:2:2*N
                R4(k,l)=-rxf(i)*rxf(j);
            end
        end
    end
end 

R=R1+R2+R3+R4;
    
L1d=ones(2*N,1)*(N-1);
L1=diag(L1d);

L2=zeros(2*N,2*N);
for i=1:2:2*N
    for j=1:2:2*N
        if i==j
            L2(i,j)=0;
        else
            L2(i,j)=-1;
        end
    end
end

for i=2:2:2*N
    for j=2:2:2*N
        if i==j
            L3(i,j)=0;
        else
            L3(i,j)=-1;
        end
    end
end

L4=L3+L2;
L=L4+L1;

H=(-L-In3*R);

for i=3:2*N
    f_dot(i)= H(i,:)*f(:);
end

f_dot=f_dot';
