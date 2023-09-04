% Q1
function fftPlot(filename)
    % Read the audio file
    [audioSignal, sampleRate] = audioread(filename);

    % Compute the FFT of the audio signal
    fftResult = fft(audioSignal);
   
    % Calculate the magnitude spectrum
    magnitudeSpectrum = abs(fftResult);
    
    % Find the frequency value corresponding to the fundamental harmonic (peak)
    [~, maxIndex] = max(magnitudeSpectrum);
    fundamentalFrequencyHz = (maxIndex - 1) * sampleRate / length(audioSignal);
    
    % Plot the magnitude spectrum in dB scale versus frequency
    f = linspace(0, sampleRate, length(audioSignal));
    magnitudeSpectrumdB = 20*log10(magnitudeSpectrum);
    
    %fprintf('The peak value is %.2f', pks);
    fprintf('Fundamental Frequency for %s: %.2f Hz\n', filename, fundamentalFrequencyHz);
end
