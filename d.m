function df = d(f, a, domain)
N = length(f); % should be power of two
wave_nums = 0:N-1;
wave_scaled = (2.*pi.*wave_nums./(domain)).^a*exp(1i*a*pi/2);
%D_vector = ifft(wave_scaled,'symmetric');
%D2 = gallery('circul',D_vector);
D = diag(wave_scaled);

df = ifft(fft(f)*D,'symmetric');
end