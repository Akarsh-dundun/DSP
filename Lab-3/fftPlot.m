% Q1
function fftPlot(filename)
    % Read the audio file
    [audioSignal, sampleRate] = audioread(filename);

    % Compute the FFT of the audio signal
    fftResult = fft(audioSignal);
    L = length(audioSignal);
    
    % Plotting the Amplitude spectrum for each file
    f = sampleRate*(0:(L/2))/L;
    P2 = abs(fftResult/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    
    %[pks,locs] = findpeaks(P1);
    
    plot(f,P1) 
    title('Amplitude Spectrum')
    xlabel('f (Hz)')
    ylabel('|P1(f)|')
    
    % Calculate the magnitude spectrum
    magnitudeSpectrum = abs(fftResult);
    
    % Find the frequency value corresponding to the fundamental harmonic (peak)
    [~, maxIndex] = max(magnitudeSpectrum);
    fundamentalFrequencyHz = (maxIndex - 1) * sampleRate / length(audioSignal);
    
    % Plot the magnitude spectrum in dB scale versus frequency
    f = linspace(0, sampleRate, length(audioSignal));
    magnitudeSpectrumdB = 20*log10(magnitudeSpectrum);
    
    figure;
    plot(f, magnitudeSpectrumdB);
    title('Magnitude Spectrum (dB)');
    xlabel('Frequency (Hz)');
    ylabel('Magnitude (dB)');
    grid on;
    
    %fprintf('The peak value is %.2f', pks);
    fprintf('Fundamental Frequency for %s: %.2f Hz\n', filename, fundamentalFrequencyHz);
end
