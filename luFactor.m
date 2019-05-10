%Max Harlan - LU Decomposition
%This is a fucntion that uses the LU Factorization solve a system of
%equations for unknown variable.
%A will be the only input value as a system of eqautions values in matrix
%form.
%The outputs will be L, the lower triangular matrix, U, the upper
%triangular matirx, and P, the pivot matrix
function[L,U,P] = luFactor(A)
    [x,y] = size(A);
    %This will determine the size of the matrix, which must be a square.
    
    if x == 1 
        error('Matrix cannot be a scalar')
        %This will help tell the user to make sure the dimensions of the
        %matrix is not a scalar.
        
    elseif y ~= x
        error('Values of matrix dimensions must be equal')
        %This tells the user that the matrix must be a square matrix in
        %order for LU Decomposition to run.
        
    end
        L = zeros(x);
        %Initializes the matrix with 0 and creates matrix with parameters
        
        U = A; 
        % U is the pivoted matirx
        
        P = eye(x);
        %Identity matrix
        
        for s = 1:x-1
            for q = (s:x-1)
               for z = s+1:x
                % Sets up three for loops, s for strictly a setup for q and gaussian elimination, q
                % for pivoting with L,U,P, and z for gaussian elimination.
                
                [~,pindex] = max(abs(U(q:x,s)));
                pindex = pindex + q - 1;
                % This will swap certain lines of the matrix to set up
                % values in a decreasing order in the primary slot from top
                % to bottom
                
                c1 = U(pindex,:);
                c2 = U(q,:);
                U(q,:) = c1;
                U(pindex,:) = c2;
                %This pivots for the U portion of the matrix.
                
                
                d1 = P(pindex,:);
                d2 = P(q,:);
                P(q,:) = d1;
                P(pindex,:) = d2;
                %This pivots for the P function. develops Pivot matrix.
                
                
                e1 = L(pindex,:);
                e2 = L(q,:);
                L(q,:) = e1;
                L(pindex,:) = e2;
                %This pivots for the L matrix.
                
                L(z,s) = U(z,s)/U(s,s);
                U(z,:) = U(z,:) - L(z,s)*U(s,:);
                %this is the gaussian elimination ortion of which sets up
                %triangular matrices, upper for U and lower for L
                
               end
            end
        end
        
            for r=1:x
                L(r,r) = 1;
                %This sets up the L matrix to have 1's in a diagonal formation
                %to complete the lower triangular matrix instead of zeros.
            end 
          
            P = P
            %Displays the P matrix, pivot matrix.
            
            L = L
            %Displays the L matrix, Lower triangular matirx.
            
            U = U
            %Displays the U Matrix, Upper triangular matrix.
end
