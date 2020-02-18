function clipwav(x, a)
    s = (0.4 + 0.1 * rand(1,1)[1]);
    c = (s + 1) / 2;
    k = (1 - s) / (s - c)^2;
    x /= maximum(abs.(x));
    x *= a;
    for i = 1:length(x)
        if c < x[i]
            x[i] = 1.0;
        elseif s < x[i] <= c
            x[i] = -k * ( x[i] - c )^2 + 1;
        elseif -c <= x[i] < -s
            x[i] = k * ( x[i] + c )^2 - 1;
        elseif x[i] < -c
            x[i] = -1.0;
        end
    end
    return x
end
