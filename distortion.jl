function clipwav(x, a)
    s = (0.4 + 0.1 * rand());
    c = (s + 1) / 2;
    k = (1 - s) / (s - c)^2;
    x *= a/maximum(abs.(x));
    for t = 1:length(x)
        if c < x[t]
            x[t] = 1.0;
        elseif s < x[t] <= c
            x[t] = -k * ( x[t] - c )^2 + 1;
        elseif -c <= x[t] < -s
            x[t] =  k * ( x[t] + c )^2 - 1;
        elseif x[t] < -c
            x[t] = -1.0;
        end
    end
    return x
end
