
% test

% denote getDCI parameters
FDRA = 10;
TDRA = 1;
VrbPrb = 0;
modulation_and_coding_scheme = 0;
redundancy_Version = 0;
SII = 0;
ReservedBits = zeros(1,15);

% get dci format 1_0 according to the TS
DM = genDCI(FDRA, TDRA, VrbPrb,modulation_and_coding_scheme,redundancy_Version, SII,ReservedBits);

% payload coding 38.212: CRC attachment (7.3.2),
% Channel coding (7.3.3), Rate mathcing (7.3.4).
crc_type = 'crc24c';

%encoding
codeword = Encode_DCI(DM,crc_type);

% %dci encoding test
% nID = 2;
% n_RNTI = 1;
% codeword_test = nrDCIEncode(DM.',n_RNTI, 864);
isequal(codeword_test, codeword .');

%decoding
dcibits = Decode_DCI(codeword,crc_type);

% %dci decoding test
% K = 39;
% L = 8;
% dcibits_test = nrDCIDecode(codeword.',K,L,n_RNTI);
% isequal(dcibits_test, dcibits .');

%common test (our functions)
%isequal(DM, dcibits);

symbols = get_pdcch_symbols(codeword, nID, n_RNTI);

%               ПОЛУЧИМ ИСХОДНЫЕ БИТЫ DCI
% Необходимо воплотить функцию nrPDCCHDecode и получить из qpsk символов
% codeword
% Для этого: 1 - демодуляция; 2 - дескремблирование 

received_codeword = de_get_pdcch_symbols(symbols, nID, n_RNTI);