#include<windows.h>
#include<stdio.h>
int RS232_init(LPCSTR port, int rate, HANDLE* hComm) {

	*hComm = CreateFileA(port,                //port name
		GENERIC_READ | GENERIC_WRITE, //Read/Write
		0,                            // No Sharing
		NULL,                         // No Security
		OPEN_EXISTING,// Open existing port only
		0,            // Non Overlapped I/O
		NULL);        // Null for Comm Devices

	if (hComm == INVALID_HANDLE_VALUE)
		printf("Error in opening serial port");
	else
		printf("opening serial port successful");

	printf("intialisizing params");
	DCB dcbSerialParams = { 0 }; // Initializing DCB structure
	dcbSerialParams.DCBlength = sizeof(dcbSerialParams);
	int Status = GetCommState(hComm, &dcbSerialParams);
	dcbSerialParams.BaudRate = rate;  // Setting BaudRate = 256
	dcbSerialParams.ByteSize = 8;         // Setting ByteSize = 8
	dcbSerialParams.StopBits = ONESTOPBIT;// Setting StopBits = 1
	dcbSerialParams.Parity = ODDPARITY;  // Setting Parity = None
	dcbSerialParams.fRtsControl = RTS_CONTROL_TOGGLE;
	SetCommState(hComm, &dcbSerialParams);
	SetCommMask(hComm, EV_RXCHAR);
	return 0;
}
void RS232_read_one(HANDLE hComm, char* c) {
	char buff_one;
	DWORD byte_read;
	DWORD mask;
	MemoryBarrier();
	*c = '\0';
	WaitCommEvent(hComm, &mask, NULL);
	ReadFile(hComm, c, 1, NULL, NULL);
	MemoryBarrier();
}
void RS232_write_one(HANDLE hComm, char c) {
	WriteFile(hComm,        // Handle to the Serial port
		&c,     // Data to be written to the port
		1,  //No of bytes to write
		NULL, //Bytes written
		NULL);
}


int main()
{
	HANDLE hComm;
	RS232_init((LPCSTR)"\\\\.\\COM4", 10000, &hComm);
	Sleep(10);
	char c;
	do
	{
		printf("write:a\n");
		RS232_write_one(hComm, 'a');


		RS232_read_one(hComm, &c);
		printf("read: %c \n", c);

	} while (!getchar());

	CloseHandle(hComm);//Closing the Serial Port

	return 0;
}
