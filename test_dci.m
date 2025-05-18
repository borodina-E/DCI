
% test 

% введём параметры для функции getDCI
FDRA = 10;
TDRA = 1;
VrbPrb = 0;
modulation_and_coding_scheme = 0;
redundancy_Version = 0;
SII = 0;
ReservedBits = zeros(1,15);

% получим биты dci для формата format 1_0 в соответствие со стандартом
DM = genDCI(FDRA, TDRA, VrbPrb,modulation_and_coding_scheme,redundancy_Version, SII,ReservedBits);


% закодируем биты полезной нагрузки 38.212 с использование CRC attachment (раздел 7.3.2),
% Channel coding (7.3.3), Rate mathcing (раздел 7.3.4).
crc_type = 'crc24c';

codeword = Encode_DCI(DM,crc_type);

% Get the PDCCH QPSK symbols nrPDCCH

%nID = 17;
%n_RNTI = 1;
%symbols = get_pdcch_symbols(codeword, nID, n_RNTI);

% Необходимо произвести слепое декодирование битов DCI 

%decode_dci = decode_payload(nID, n_RNTI);
K = 39;
L = 16;
dcibits = Decode_DCI(codeword,crc_type);
dcibits_test = nrDCIDecode(codeword.',K,L);
