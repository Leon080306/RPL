SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT inputRID PROMPT 'Enter Staff Number (STAFFNO): '

DECLARE
    vStaffNo CHAR(4);
    vNama VARCHAR2(100);
    vJabatan VARCHAR2(15);
    vJenisKelamin CHAR(1);
    vTanggalLahir DATE;
    vGaji NUMBER;
    vCabang CHAR(4);
BEGIN
    BEGIN
        SELECT STAFFNO, FNAME || ' ' || LNAME, SPOSITION, SEX,
               DOB,
               SALARY,
               BRANCHNO
        INTO vStaffNo, vNama, vJabatan, vJenisKelamin, vTanggalLahir, vGaji, vCabang
        FROM STAFF
        WHERE STAFFNO = '&inputRID';

        DBMS_OUTPUT.PUT_LINE(RPAD('STAFFNO', 15) || ': ' || vStaffNo);
        DBMS_OUTPUT.PUT_LINE(RPAD('Nama', 15) || ': ' || vNama);
        DBMS_OUTPUT.PUT_LINE(RPAD('Jabatan', 15) || ': ' || vJabatan);
        DBMS_OUTPUT.PUT_LINE(RPAD('Jenis Kelamin', 15) || ': ' || vJenisKelamin);
        DBMS_OUTPUT.PUT_LINE(RPAD('Tanggal Lahir', 15) || ': ' || TO_CHAR(vTanggalLahir, 'DD-MON-YYYY'));
        DBMS_OUTPUT.PUT_LINE(RPAD('Gaji', 15) || ': ' || vGaji);
        DBMS_OUTPUT.PUT_LINE(RPAD('Cabang', 15) || ': ' || vCabang);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('STAFFNO ' || '&inputRID' || ' not found.');
    END;
END;
/