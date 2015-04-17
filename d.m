function df = d(f, a, domain, max_freq)
if nargin < 4
    max_freq = length(f);
end

N = length(f); % should be power of two
wave_nums = 0:N-1;
wave_nums = [0:1:ceil(N/2),-floor(N/2)+1:1:-1];
wave_scaled = (2.*pi.*wave_nums./(domain)).^a*exp(1i*a*pi/2);
wave_scaled(1) = 0;
%D_vector = ifft(wave_scaled,'symmetric');
%D2 = gallery('circul',D_vector);
D = diag(wave_scaled);

l = length(f);
if l > max_freq
    ff = fft(f);
    F = [ff(1:max_freq/2),zeros(1,l-max_freq),ff(l-max_freq/2+1:l)];
else
    F = fft(f);
end
df = ifft(F*D,'symmetric');
end