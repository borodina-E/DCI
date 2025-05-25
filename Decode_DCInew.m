function dcibits = Decode_DCI(...
    dcicw,                         ... 
    crc_type                       ... % must be "crc<length><?letter>" letter is only necessary crc24_
    )

arguments
    dcicw (1,:) % vector string
    %bitstream
    crc_type string
    %attach_zeros=true

end

dcibits = rateRecovery(dcicw);

dcibits = polarDecoding(dcibits); 

[dcibits,verification_success] = verifyParity(dcibits,crc_type);


end