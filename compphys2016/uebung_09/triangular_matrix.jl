fuction triangular_matrix(M::Array{Float64,2}, b::Array{Float64,1}; inexact=1e-9)
    # this function transforms the matrix M into an upper triangular matrix
    # vector b gets transformed the same way
    
    size(M, 1) != size(b, 1) && error("E: size of matrix and vector do not match")
    local dim = size(M, 1) # dimension of M

    for i in 1:dim-1
        if M[i, i] <= inexact
            # element is to small, search for bigger one
                # if found: swap lines / columns
                # if not: continue anyway
        end
        
        # for all lines below the actual one: substract c*M[i, :] from this line
        # calculate c so that the elements in this column get 0
        for j in i+1:dim
            c = M[j, i] / M[i, i]
            M[j, i:end] = M[j, i:end] - c*M[i, i]
            b[j] = b[j] - c*b[i]
        end
        println()
    end
    return (M, b)
end
