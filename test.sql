SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT inputRID PROMPT 'Enter Staff Number (STAFFNO): '

DECLARE
    vStaffNo CHAR(4);
    vNama VARCHAR2(100);
    vJabatan VARCHAR2(15);
    vJenisKelamin VARCHAR2(10);
    vTanggalLahir DATE;
    vGaji NUMBER;
    vBranchNo CHAR(4);
    vStreet VARCHAR2(100);
    vCity VARCHAR2(100);
BEGIN
    SELECT 
        STAFFNO,
        FNAME || ' ' || LNAME,
        SPOSITION,
        CASE 
            WHEN SEX = 'M' THEN 'Pria'
            ELSE 'Wanita'
        END,
        DOB,
        SALARY,
        BRANCH.BRANCHNO,
        BRANCH.STREET,
        BRANCH.CITY
    INTO 
        vStaffNo,
        vNama,
        vJabatan,
        vJenisKelamin,
        vTanggalLahir,
        vGaji,
        vBranchNo,
        vStreet,
        vCity
    FROM STAFF
    INNER JOIN BRANCH ON STAFF.BRANCHNO = BRANCH.BRANCHNO
    WHERE STAFFNO = '&inputRID';

    DBMS_OUTPUT.PUT_LINE(RPAD('No Staff', 15) || ': ' || vStaffNo);
    DBMS_OUTPUT.PUT_LINE(RPAD('Nama Staff', 15) || ': ' || vNama);
    DBMS_OUTPUT.PUT_LINE(RPAD('Cabang', 15) || ': ' || vStreet || ' ' || vCity || ' (' || vBranchNo || ')');
    DBMS_OUTPUT.PUT_LINE(RPAD('Jabatan', 15) || ': ' || vJabatan);
    DBMS_OUTPUT.PUT_LINE(RPAD('Jenis Kelamin', 15) || ': ' || vJenisKelamin);
    DBMS_OUTPUT.PUT_LINE(RPAD('Tanggal Lahir', 15) || ': ' || TO_CHAR(vTanggalLahir, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Gaji (Annual)', 15) || ': Rp.' || REPLACE(TO_CHAR(vGaji * 16000, '999,999,999'), ',', '.') || ',-');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('STAFFNO ' || '&inputRID' || ' not found.');
END;
/
